pageextension 50016 SalesInvoiceSubform extends "Sales Invoice Subform"
{
    layout
    {
        // addafter(Description)
        // {
        //     field("Description 2"; Rec."Description 2")
        //     {
        //         ApplicationArea = All;
        //     }
        // }
        addafter("Location Code")
        {
            field("No.of Packages"; Rec."No.of Packages")
            {
                ApplicationArea = All;
            }
            field("No Of Units"; Rec."No Of Units")
            {
                ApplicationArea = All;
            }
            field("H.S.Code"; Rec."H.S.Code")
            {
                ApplicationArea = All;
            }
        }
        addafter("Unit of Measure Code")
        {
            field("Currency Code"; Rec."Currency Code")
            {
                ApplicationArea = All;
            }
        }
        // addafter("Line Discount %")
        // {
        //     field("Tax Liable"; Rec."Tax Liable")
        //     {
        //         ApplicationArea = All;
        //     }
        //     field("Tax Area Code";Rec."Tax Area Code")
        //     {
        //         ApplicationArea = All;
        //     }
        //     field("Tax Group Code"; Rec."Tax Group Code")
        //     {
        //         ApplicationArea = All;
        //     }
        // }
        addafter("Line No.")
        {
            // field("Gross Weight"; Rec."Gross Weight")
            // {
            //     ApplicationArea = All;
            // }
            // field("Net Weight"; Rec."Net Weight")
            // {
            //     ApplicationArea = All;
            // }
            field("Shipping Marks"; Rec."Shipping Marks")
            {
                ApplicationArea = All;
            }
            field("Packing Comm."; Rec."Packing Comm.")
            {
                ApplicationArea = All;
            }
        }
    }
}