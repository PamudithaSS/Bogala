tableextension 50022 SalesLine extends "Sales Line"
{
    fields
    {
        field(50000; "Shipping Marks"; Text[60])
        {
            DataClassification = ToBeClassified;
        }
        field(50001; "No.of Packages"; Text[30])
        {
            DataClassification = ToBeClassified;
        }
        field(50002; "Packing Comm."; Text[80])
        {
            DataClassification = ToBeClassified;
        }
        field(50003; "No Of Units"; Text[30])
        {
            DataClassification = ToBeClassified;
        }
        field(50004; "H.S.Code"; Text[30])
        {
            DataClassification = ToBeClassified;
        }
        field(50005; "count"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(50006; "pakage name"; Text[30])
        {
            DataClassification = ToBeClassified;
        }
    }

}