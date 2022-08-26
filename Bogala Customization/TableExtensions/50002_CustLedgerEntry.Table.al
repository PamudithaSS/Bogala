tableextension 50002 CustLedgerEntry extends "Cust. Ledger Entry"
{
    fields
    {
        field(50000; "Bank Branch Code"; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(50010; "Description 2"; Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(50015; "REM_TYPE"; Text[1])
        {
            DataClassification = ToBeClassified;
        }
        field(50016; "CHG_FROM"; Text[1])
        {
            DataClassification = ToBeClassified;
        }
    }
}