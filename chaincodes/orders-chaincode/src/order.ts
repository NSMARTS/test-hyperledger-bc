/*
  SPDX-License-Identifier: Apache-2.0
*/

import { Object, Property } from 'fabric-contract-api';

@Object()
export class Order {
  @Property()
  public docType?: string;

  @Property()
  public ID: string;

  @Property()
  public Writer: string;

  @Property()
  public Orders: any[];

  @Property()
  public To: string;

  @Property()
  public TotalCount: number;

  @Property()
  public CreateAt?: string;

  @Property()
  public UpdatedAt?: string;


}

export interface OrderInterface {
  docType?: string,
  _id: string,
  writer: string,
  orders: any[],
  to: string,
  totalCount: number,
  createdAt?: string,
  updatedAt?: string,
}