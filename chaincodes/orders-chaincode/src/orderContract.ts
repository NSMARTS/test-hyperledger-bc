import { Order, OrderInterface } from './order';
/*
 * SPDX-License-Identifier: Apache-2.0
 */
// Deterministic JSON.stringify()
import { Context, Contract, Info, Returns, Transaction } from 'fabric-contract-api';
import stringify from 'json-stringify-deterministic';
import sortKeysRecursive from 'sort-keys-recursive';

@Info({ title: 'OrderTransfer', description: 'Smart contract for trading order' })
export class OrderContract extends Contract {

  @Transaction()
  public async InitLedger(ctx: Context): Promise<void> {
    const orders: Order[] = [
      {
        ID: 'a123456789123352462346',
        Writer: 'a12335436234623462',
        Orders: [
          {
            _id: 'a123456789',
            food: 'pork_belly',
            name: '삼겹살',
            price: 10000,
            count: 0
          }
        ],
        To: '서울특별시',
        TotalCount: 0,
        CreateAt: '2024-05-29T07:39:38.473+00:00',
        UpdatedAt: '2024-05-29T07:39:38.473+00:00'
      }
    ];

    for (const order of orders) {
      order.docType = 'order';
      // example of how to write to world state deterministically
      // use convetion of alphabetic order
      // we insert data in alphabetic order using 'json-stringify-deterministic' and 'sort-keys-recursive'
      // when retrieving data, in any lang, the order of data will be the same and consequently also the corresonding hash
      await ctx.stub.putState(order.ID, Buffer.from(stringify(sortKeysRecursive(order))));
      console.info(`Asset ${order.ID} initialized`);
    }
  }

  // CreateAsset issues a new asset to the world state with given details.
  @Transaction()
  public async CreateOrder(
    ctx: Context,
    _id: string,
    writer: string,
    orders: string,
    to: string,
    totalCount: number,
    createdAt?: string,
    updatedAt?: string,
  ): Promise<void> {

    const exists = await this.OrderExists(ctx, _id);
    if (exists) {
      throw new Error(`The order ${_id} already exists`);
    }
    // JSON 문자열을 파싱하여 배열로 변환
    // const ordersArray = JSON.parse(orders);

    const order = {
      ID: _id,
      Writer: writer,
      Orders: orders,
      To: to,
      TotalCount: totalCount,
      CreatedAt: createdAt,
      UpdatedAt: updatedAt,
    };
    // we insert data in alphabetic order using 'json-stringify-deterministic' and 'sort-keys-recursive'
    await ctx.stub.putState(_id, Buffer.from(stringify(sortKeysRecursive(order))));
  }


  // Readl\Order returns the order stored in the world state with given id.
  // getStateByRange를 통해 상세조회
  // getState는 데이터를 빨리 읽기 위해 보증정책을 무시한다.
  @Transaction()
  public async ReadOrder(ctx: Context, _id: string): Promise<string> {
    const orderJSON = await ctx.stub.getState(_id); // get the order from chaincode state
    if (!orderJSON || orderJSON.length === 0) {
      throw new Error(`The order ${_id} does not exist`);
    }
    return orderJSON.toString();
  }

  // 계약서 _id조회
  // getStateByRange를 통해 상세조회
  // getState는 데이터를 빨리 읽기 위해 보증정책을 무시한다.
  // 그래서 함수안에서 contract 존재 유무 확인은 ReadOrder를 사용하고
  // ReadContractById()는 단독으로 웹서비스에서 사용
  @Transaction()
  public async ReadContractById(ctx: Context, _id: string): Promise<string> {
    const allResults = [];
    const startKey = _id;
    const endKey = _id + '\u0000';
    // range query with empty string for startKey and endKey does an open-ended query of all orderContracts in the chaincode namespace.
    const iterator = await ctx.stub.getStateByRange(startKey, endKey);
    let result = await iterator.next();
    while (!result.done) {
      const strValue = Buffer.from(result.value.value.toString()).toString('utf8');
      let record;
      try {
        record = JSON.parse(strValue);
      } catch (err) {
        console.log(err);
        record = strValue;
      }
      allResults.push(record);
      result = await iterator.next();
    }
    return JSON.stringify(allResults);
  }

  // 어드민 페이지에서 계약서 삭제 코드
  @Transaction()
  public async DeleteOrder(ctx: Context, _id: string): Promise<void> {
    const exists = await this.OrderExists(ctx, _id);
    if (!exists) {
      throw new Error(`The Order ${_id} does not exist`);
    }
    return ctx.stub.deleteState(_id);
  }

  // OrderExists returns true when ㅣeaveRequest with given ID exists in world state.
  @Transaction(false)
  @Returns('boolean')
  public async OrderExists(ctx: Context, _id: string): Promise<boolean> {
    const orderJSON = await ctx.stub.getState(_id);
    return orderJSON && orderJSON.length > 0;
  }

  // TransferOrder updates the owner field of order with given id in the world state, and returns the old owner.
  @Transaction()
  public async UpdateOrder(
    ctx: Context,
    _id: string,
    writer: string,
    orders: string,
    to: string,
    totalCount: number,
    createdAt?: string,
    updatedAt?: string
  ): Promise<string> {
    const orderString = await this.ReadOrder(ctx, _id);
    const order = JSON.parse(orderString);
    order.Writer = writer;
    order.Orders = orders;
    order.To = to;
    order.TotalCount = totalCount;
    order.CreatedAt = createdAt;
    order.UpdatedAt = updatedAt;
    // we insert data in alphabetic order using 'json-stringify-deterministic' and 'sort-keys-recursive'
    await ctx.stub.putState(_id, Buffer.from(stringify(sortKeysRecursive(order))));
    return order;
  }



  // 계약서 전체 조회
  @Transaction()
  @Returns('string')
  public async GetAllOrders(ctx: Context): Promise<string> {
    const allResults = [];
    // range query with empty string for startKey and endKey does an open-ended query of all orders in the chaincode namespace.
    const iterator = await ctx.stub.getStateByRange('', '');
    let result = await iterator.next();
    while (!result.done) {
      const strValue = Buffer.from(result.value.value.toString()).toString('utf8');
      let record;
      try {
        record = JSON.parse(strValue);
      } catch (err) {
        console.log(err);
        record = strValue;
      }
      allResults.push(record);
      result = await iterator.next();
    }
    return JSON.stringify(allResults);
  }

}
