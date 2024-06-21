import { ContractInfo, ContractInfoInterface } from './contractInfo';
/*
 * SPDX-License-Identifier: Apache-2.0
 */
// Deterministic JSON.stringify()
import { Context, Contract, Info, Returns, Transaction } from 'fabric-contract-api';
import stringify from 'json-stringify-deterministic';
import sortKeysRecursive from 'sort-keys-recursive';

@Info({ title: 'ContractTransfer', description: 'Smart contract for trading order' })
export class ContractInfoContract extends Contract {

  @Transaction()
  public async InitLedger(ctx: Context): Promise<void> {
    const contractInfos: ContractInfo[] = [
      {
        ID: 'a123456789123352462346',
        Title: '근로계약서',
        Writer: 'c12335436234623462',
        Originalname: '근로계약서.pdf',
        Key: 'path/asdfasdfaasdf',
        Location: 'aws~~~~',
        PdfHash: '123456789',
        ReceiverA: 'a123456789101112',
        StatusA: 'Signed',
        SignA: 'asdfasdfasdfasdfasdfa',
        SignPointerA: [{
          pageNum: 1,
          drawingEvent: [
            {
              points: [55, 63, 56, 63, 57, 63],
              tool: {
                type: 'pen',
                width: 4,
                color: 'black'
              },
              timeDiff: 682
            }
          ]
        }],
        ReceiverB: 'a123456789101112',
        StatusB: 'Signed',
        SignB: 'asdfasdfasdfasdfasdfa',
        SignPointerB: [{
          pageNum: 1,
          drawingEvent: [
            {
              points: [55, 63, 56, 63, 57, 63],
              tool: {
                type: 'pen',
                width: 4,
                color: 'black'
              },
              timeDiff: 682
            }
          ]
        }],
        CreateAt: '2024-05-29T07:39:38.473+00:00',
        UpdatedAt: '2024-05-29T07:39:38.473+00:00'
      }
    ];

    for (const contractInfo of contractInfos) {
      contractInfo.docType = 'contractInfo';
      // example of how to write to world state deterministically
      // use convetion of alphabetic order
      // we insert data in alphabetic order using 'json-stringify-deterministic' and 'sort-keys-recursive'
      // when retrieving data, in any lang, the order of data will be the same and consequently also the corresonding hash
      await ctx.stub.putState(contractInfo.ID, Buffer.from(stringify(sortKeysRecursive(contractInfo))));
      console.info(`Asset ${contractInfo.ID} initialized`);
    }
  }

  // CreateAsset issues a new asset to the world state with given details.
  @Transaction()
  public async CreateContractInfo(
    ctx: Context,
    _id: string,
    title: string,
    writer: string,
    pdfHash: string,
    originalname: string,
    key: string,
    location: string,
    receiverA: string,
    receiverB: string,
    createdAt?: string,
    updatedAt?: string,
  ): Promise<void> {

    const exists = await this.ContractInfoExists(ctx, _id);
    if (exists) {
      throw new Error(`The contract info ${_id} already exists`);
    }
    // JSON 문자열을 파싱하여 배열로 변환
    // const ordersArray = JSON.parse(orders);

    const contractInfo = {
      ID: _id,
      Title: title,
      Writer: writer,
      PdfHash: pdfHash,
      Originalname: originalname,
      Key: key,
      Location: location,
      ReceiverA: receiverA,
      ReceiverB: receiverB,
      CreatedAt: createdAt,
      UpdatedAt: updatedAt,
    };
    // we insert data in alphabetic order using 'json-stringify-deterministic' and 'sort-keys-recursive'
    await ctx.stub.putState(_id, Buffer.from(stringify(sortKeysRecursive(contractInfo))));
  }

  // Readl\Order returns the order stored in the world state with given id.
  // getStateByRange를 통해 상세조회
  // getState는 데이터를 빨리 읽기 위해 보증정책을 무시한다.
  @Transaction()
  public async ReadContractInfo(ctx: Context, _id: string): Promise<string> {
    const contractInfoJSON = await ctx.stub.getState(_id); // get the contract from chaincode state
    if (!contractInfoJSON || contractInfoJSON.length === 0) {
      throw new Error(`The contract ${_id} does not exist`);
    }
    return contractInfoJSON.toString();
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
  public async DeleteContractInfo(ctx: Context, _id: string): Promise<void> {
    const exists = await this.ContractInfoExists(ctx, _id);
    if (!exists) {
      throw new Error(`The Contract Info ${_id} does not exist`);
    }
    return ctx.stub.deleteState(_id);
  }

  // OrderExists returns true when ㅣeaveRequest with given ID exists in world state.
  @Transaction(false)
  @Returns('boolean')
  public async ContractInfoExists(ctx: Context, _id: string): Promise<boolean> {
    const contractInfoJSON = await ctx.stub.getState(_id);
    return contractInfoJSON && contractInfoJSON.length > 0;
  }

  // TransferOrder updates the owner field of order with given id in the world state, and returns the old owner.
  @Transaction()
  public async UpdateContractInfo(
    ctx: Context,
    _id: string,
    title: string,
    writer: string,
    pdfHash: string,
    originalname: string,
    key: string,
    location: string,
    receiverA: string,
    receiverB: string,
    createdAt?: string,
    updatedAt?: string,
  ): Promise<string> {
    const contractInfoString = await this.ReadContractInfo(ctx, _id);
    const contractInfo = JSON.parse(contractInfoString);
    contractInfo.Title = title;
    contractInfo.Writer = writer;
    contractInfo.PdfHash = pdfHash;
    contractInfo.Originalname = originalname;
    contractInfo.Key = key;
    contractInfo.Location = location;
    contractInfo.ReceiverA = receiverA;
    contractInfo.ReceiverB = receiverB;
    contractInfo.CreatedAt = createdAt;
    contractInfo.UpdatedAt = updatedAt;
    // we insert data in alphabetic contractInfo using 'json-stringify-deterministic' and 'sort-keys-recursive'
    await ctx.stub.putState(_id, Buffer.from(stringify(sortKeysRecursive(contractInfo))));
    return contractInfo;
  }

  @Transaction()
  public async SignContractInfo(
    ctx: Context,
    _id: string,
    receiver: string,
    status: string,
    sign: string,
    signPointer: string,
    createdAt?: string,
    updatedAt?: string,
  ): Promise<string> {

    const signField = receiver === 'a' ? 'signA' : 'signB';
    const statusField = receiver === 'a' ? 'statusA' : 'statusB';
    const signPointerField = receiver === 'a' ? 'signPointerA' : 'signPointerB';


    const contractInfoString = await this.ReadContractInfo(ctx, _id);
    const contractInfo = JSON.parse(contractInfoString);
    contractInfo[statusField] = status
    contractInfo[signField] = sign
    contractInfo[signPointerField] = signPointer

    contractInfo.CreatedAt = createdAt;
    contractInfo.UpdatedAt = updatedAt;
    // we insert data in alphabetic contractInfo using 'json-stringify-deterministic' and 'sort-keys-recursive'
    await ctx.stub.putState(_id, Buffer.from(stringify(sortKeysRecursive(contractInfo))));
    return contractInfo;
  }




  // 계약서 전체 조회
  @Transaction()
  @Returns('string')
  public async GetAllContractInfos(ctx: Context): Promise<string> {
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
