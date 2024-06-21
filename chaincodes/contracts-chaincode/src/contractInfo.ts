/*
  SPDX-License-Identifier: Apache-2.0
*/

import { Object, Property } from 'fabric-contract-api';

@Object()
export class ContractInfo {
  @Property()
  public docType?: string;

  @Property()
  public ID: string;
  @Property()
  public Title: string;
  @Property()
  public Writer: string;
  @Property()
  public Originalname: string;
  @Property()
  public Key: string;
  @Property()
  public Location: string;
  @Property()
  public PdfHash: string;
  @Property()
  public ReceiverA: string;
  @Property()
  public StatusA: string;
  @Property()
  public SignA: string;
  @Property()
  public SignPointerA: any[];
  @Property()
  public ReceiverB: string;
  @Property()
  public StatusB: string;
  @Property()
  public SignB: string;
  @Property()
  public SignPointerB: any[];


  @Property()
  public CreateAt?: string;

  @Property()
  public UpdatedAt?: string;


}

export interface ContractInfoInterface {
  docType?: string,
  _id: string,
  writer: string,
  orders: any[],
  to: string,
  totalCount: number,
  createdAt?: string,
  updatedAt?: string,
}