tableextension 50010 UserSetup extends "User Setup"
{
    fields
    {
        field(50010; "Mobile Number"; Text[30])
        {
            DataClassification = ToBeClassified;
        }
        field(50011; Location; Code[10])
        {
            DataClassification = ToBeClassified;
            TableRelation = Location where("Use As In-Transit" = const(false));
        }
        field(50012; "User Full Name"; Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(50013; "User Role Center"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(50014; "Delete User Personalization"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(50015; "PO Delete"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
    }
}