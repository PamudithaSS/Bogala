tableextension 50009 GenJournalLine extends "Gen. Journal Line"
{
    fields
    {
        field(50000; "Bank Branch Code"; Code[7])
        {
            DataClassification = ToBeClassified;
            //TableRelation = Table50005.Field1 WHERE (Field1=FIELD("Bank Branch Code"))
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
        field(50011; "G/L Account Name"; Text[100])
        {
            FieldClass = FlowField;
            CalcFormula = lookup("G/L Account".Name where("No." = field("Account No.")));
        }
        field(50015; "REM_TYPE"; Text[1])
        {
            DataClassification = ToBeClassified;
        }
        field(50016; "CHG_FROM"; Text[1])
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
    }
}