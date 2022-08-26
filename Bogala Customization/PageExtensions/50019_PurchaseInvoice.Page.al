pageextension 50019 PurchaseInvoice extends "Purchase Invoice"
{
    layout
    {
        addafter("Document Date")
        {
            field("Order Date"; Rec."Order Date")
            {
                ApplicationArea = All;
            }
        }
        addafter("Vendor Invoice No.")
        {
            field("Vendor Invoice Date"; Rec."Vendor Invoice Date")
            {
                ApplicationArea = All;
            }
        }
        addafter("Assigned User ID")
        {
            field("Posting No. Series"; Rec."Posting No. Series")
            {
                ApplicationArea = All;
            }
            field("Receiving No. Series"; Rec."Receiving No. Series")
            {
                ApplicationArea = All;
            }
            field("Description 2"; Rec."Description 2")
            {
                ApplicationArea = All;
            }
        }
        addafter(Status)
        {
            field(Remarks; Rec.Remarks)
            {
                ApplicationArea = All;
            }
        }
        // addafter("VAT Bus. Posting Group")
        // {
        //     field("Tax Liable"; Rec."Tax Liable")
        //     {
        //         ApplicationArea = All;
        //     }
        //     field("Tax Area Code"; Rec."Tax Area Code")
        //     {
        //         ApplicationArea = All;
        //     }
        // }
        addafter("Expected Receipt Date")
        {
            field("Delivery Details"; Rec."Delivery Details")
            {
                ApplicationArea = All;
            }
            field("Part Shipment"; Rec."Part Shipment")
            {
                ApplicationArea = All;
            }
            field("Shiipping Marks"; Rec."Shiipping Marks")
            {
                ApplicationArea = All;
            }
        }
        addlast(General)
        {
            field("Approve User ID"; Rec."Approve User ID")
            {
                ApplicationArea = All;
            }
        }
    }
}