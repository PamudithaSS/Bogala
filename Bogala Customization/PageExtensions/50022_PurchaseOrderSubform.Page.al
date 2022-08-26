pageextension 50022 PurchaseOrderSubform extends "Purchase Order Subform"
{
    layout
    {
        addbefore("Unit of Measure Code")
        {
            field("Currency Code"; Rec."Currency Code")
            {
                ApplicationArea = All;
            }
        }
        addafter("Line Discount %")
        {
            field("Depreciation Book Code"; Rec."Depreciation Book Code")
            {
                ApplicationArea = All;
            }
            field("Gen. Prod. Posting Group"; Rec."Gen. Prod. Posting Group")
            {
                ApplicationArea = All;
            }
        }
        modify("Reserved Quantity")
        {
            Visible = false;
        }
        modify("Qty. to Assign")
        {
            Visible = false;
        }
        modify("Qty. Assigned")
        {
            Visible = false;
        }
        modify("Planned Receipt Date")
        {
            Visible = false;
        }
        modify("Expected Receipt Date")
        {
            Visible = false;
        }
        modify("Order Date")
        {
            Visible = false;
        }
        modify("Tax Group Code")
        {
            ApplicationArea = All;
        }
        modify("Tax Liable")
        {
            ApplicationArea = All;
        }
        modify("Tax Area Code")
        {
            ApplicationArea = All;
        }
    }
}