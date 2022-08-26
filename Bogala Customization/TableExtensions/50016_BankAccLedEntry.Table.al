tableextension 50016 BankAccLedEntry extends "Bank Account Ledger Entry"
{
    fields
    {
        field(50001; "Payee Name"; Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(50005; "Special Instruction 1"; Text[35])
        {
            DataClassification = ToBeClassified;
        }
        field(50006; "Special Instruction 2"; Text[35])
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
        field(50017; "Exported"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(50018; "Pick Up By"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = ' ,C,B';
            OptionMembers = " ","C","B";
        }
        field(50019; "Pick Up Method"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = ' ,P,M,C';
            OptionMembers = " ","P","M","C";
        }
        field(50020; "Payment Type"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = ' ,SLIPS,CC,BT,RTGS,LBC,OTT,CEFTS';
            OptionMembers = " ","SLIPS","CC","BT","RTGS","LBC","OTT","CEFTS";
        }
        field(50021; "Exported File"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
    }
}