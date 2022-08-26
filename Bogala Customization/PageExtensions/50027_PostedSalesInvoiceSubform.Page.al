pageextension 50027 PostedSalesInvoiceSubform extends "Posted Sales Invoice Subform"
{
    layout
    {
        addbefore(Description)
        {
            field("Line No."; Rec."Line No.")
            {
                ApplicationArea = All;
            }
        }
        // addafter(Description)
        // {
        //     field("Description 2"; Rec."Description 2")
        //     {
        //         ApplicationArea = All;
        //     }
        // }
        addafter("Return Reason Code")
        {
            field("No.of Packages"; Rec."No.of Packages")
            {
                ApplicationArea = All;
            }
        }
        addafter("Shortcut Dimension 2 Code")
        {
            // field("Gross Weight"; Rec."Gross Weight")
            // {
            //     ApplicationArea = All;
            // }
            // field("Net Weight"; Rec."Net Weight")
            // {
            //     ApplicationArea = All;
            // }
            field("Packing Comm."; Rec."Packing Comm.")
            {
                ApplicationArea = All;
            }
            field("Shipping Marks"; Rec."Shipping Marks")
            {
                ApplicationArea = All;
            }
            // field("Tax Group Code"; Rec."Tax Group Code")
            // {
            //     ApplicationArea = All;
            // }
        }
    }
}