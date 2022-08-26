pageextension 50029 PostedPurchaseInvoice extends "Posted Purchase Invoice"
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
        // addafter("Payment Reference")
        // {
        //     field("Tax Area Code"; Rec."Tax Area Code")
        //     {
        //         ApplicationArea = All;
        //     }
        // }
    }
}