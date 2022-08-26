tableextension 50011 GenLedSetup extends "General Ledger Setup"
{
    fields
    {
        field(50000; "Instruction for Charges"; Text[3])
        {
            DataClassification = ToBeClassified;
        }
        field(50001; "FA Capex Nos."; Code[10])
        {
            DataClassification = ToBeClassified;
            TableRelation = "No. Series";
        }
        field(50002; "Export File Path"; Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(50003; "Bulk Posting"; Text[1])
        {
            DataClassification = ToBeClassified;
        }
        field(50010; "Service Request Nos."; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "No. Series";
        }
    }
}