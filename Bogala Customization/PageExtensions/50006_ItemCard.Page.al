pageextension 50006 ItemCard extends "Item Card"
{
    layout
    {
        addafter("No.")
        {
            field("No. 2"; Rec."No. 2")
            {
                ApplicationArea = All;
            }
        }
        addafter("Item Category Code")
        {
            field("BGL Product Group Code";rec."BGL Product Group Code")
            {
                ApplicationArea = All;
            }
        }
        addafter(Description)
        {
            field("Description 2"; Rec."Description 2")
            {
                ApplicationArea = All;
            }
        }
        addbefore("Qty. on Purch. Order")
        {
            field("Qty. on Purch. Quote"; Rec."Qty. on Purch. Quote")
            {
                ApplicationArea = All;
            }
        }
        addafter(PreventNegInventoryDefaultNo)
        {
            field(Obsolete; Rec.Obsolete)
            {
                Caption = 'Status';
                ApplicationArea = All;
            }
        }
        modify("Tax Group Code")
        {
            ApplicationArea = All;
        }
    }

    actions
    {
        addafter("Item Tracing")
        {
            action("Non Moveing Item")
            {
                ApplicationArea = All;
                Image = PrintReport;
                Caption = 'Non Moveing Items';
                Promoted = true;
                PromotedCategory = Report;
                PromotedIsBig = true;
                PromotedOnly = true;
                RunObject = report "Item Non Moving Report";
            }
        }
    }
}