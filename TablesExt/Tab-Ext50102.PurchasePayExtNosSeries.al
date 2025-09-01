tableextension 50102 SERIES extends "Purchases & Payables Setup"
{
    fields
    {
        field(17; RFQ; Code[20])
        {
            Caption = 'RFQ';
            DataClassification = ToBeClassified;
            TableRelation="No. Series";
           
           
        }
        field(18; IHR; Code[20])
        {
            Caption = 'IHR';
            DataClassification = ToBeClassified;
        }
    }
}