pageextension 50070 PurchAgentExt extends "Purchase Agent Activities"
{
    layout
    {
        addafter("Upcoming Orders")
        {
            field("Request to Approve"; rec."Request to Approve")
            {
                ApplicationArea = All;
                Editable = false;
                DrillDownPageId = "Requests to Approve";
            }
            field("Purch. Quotes - Released"; Rec."Purchase Quotes - Released")
            {
                ApplicationArea = All;
                Editable = false;
                DrillDownPageId = "Purchase Quotes";
            }
        }
    }

    actions
    {
        // Add changes to page actions here
    }

}