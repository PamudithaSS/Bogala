tableextension 50018 PurchPaySetup extends "Purchases & Payables Setup"
{
    fields
    {
        field(50000; "Purchase Requistion Nos."; Code[10])
        {
            DataClassification = ToBeClassified;
            TableRelation = "No. Series";
        }
    }
}