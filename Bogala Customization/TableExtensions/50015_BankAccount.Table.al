tableextension 50015 BankAccount extends "Bank Account"
{
    fields
    {
        field(50000; "Bank Code"; Text[4])
        {
            DataClassification = ToBeClassified;
        }
        field(50001; "Branch Code"; Text[3])
        {
            DataClassification = ToBeClassified;
        }
        field(50002; "Branch Name"; Text[100])
        {
            DataClassification = ToBeClassified;
        }
    }
}