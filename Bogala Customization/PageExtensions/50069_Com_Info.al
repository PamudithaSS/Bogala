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
        }
    }

    actions
    {
        // Add changes to page actions here
    }

}