pageextension 50069 ComInfoExt extends "Company Information"
{
    layout
    {
        addafter("VAT Registration No.")
        {
            field("SVAT Registration No."; rec."SVAT Registration No.")
            {
                ApplicationArea = All;
            }
            field("SVAT %"; Rec."SVAT %")
            {
                ApplicationArea = All;
            }
        }
    }

    actions
    {
        // Add changes to page actions here
    }

}