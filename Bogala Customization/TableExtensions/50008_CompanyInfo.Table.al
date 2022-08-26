tableextension 50008 CompanyInfo extends "Company Information"
{
    fields
    {
        field(50001; "SVAT Registration No."; Text[30])
        {
            DataClassification = ToBeClassified;
        }
        field(50002; "Foreign PO Phone No"; Text[15])
        {
            DataClassification = ToBeClassified;
        }
        field(50003; "Local SO/PO Phone No"; Text[15])
        {
            DataClassification = ToBeClassified;
        }
        field(50004; "Sales Invoice / Confirmation"; Text[15])
        {
            DataClassification = ToBeClassified;
        }
    }
}