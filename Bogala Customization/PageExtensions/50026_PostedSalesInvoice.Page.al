pageextension 50026 PostedSalesInvoice extends "Posted Sales Invoice"
{
    layout
    {
        addafter("No.")
        {
            field("Description 2"; Rec."Description 2")
            {
                ApplicationArea = All;
            }
        }
        addafter("No.")
        {
            field("Packing Comm."; Rec."Packing Comm.")
            {
                ApplicationArea = All;
            }
            field("Dimension Set ID"; Rec."Dimension Set ID")
            {
                ApplicationArea = All;
            }
        }
        // addafter("Payment Method Code")
        // {
        //     field("Tax Area Code"; Rec."Tax Area Code")
        //     {
        //         ApplicationArea = All;
        //     }
        // }
        addafter("Currency Code")
        {
            field("Currency Factor"; Rec."Currency Factor")
            {
                ApplicationArea = All;
            }
        }
    }
}