page 50002 "Purchase Requisition Subform"
{
    AutoSplitKey = true;
    DelayedInsert = true;
    LinksAllowed = false;
    MultipleNewLines = true;
    PageType = ListPart;
    SourceTable = "Purchase Requistion Lines";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Document Type"; Rec."Document Type")
                {
                    ApplicationArea = All;
                }
                field("No."; Rec."No.")
                {
                    ApplicationArea = All;
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = All;
                }
                field(Quantity; Rec.Quantity)
                {
                    ApplicationArea = All;
                }
                field(Location; Rec.Location)
                {
                    ApplicationArea = All;
                }
                field("Purch. Unit of Measure"; Rec."Purch. Unit of Measure")
                {
                    ApplicationArea = All;
                }
                field("Required Delivery Date"; Rec."Required Delivery Date")
                {
                    ApplicationArea = All;
                }
                field(Remarks; Rec.Remarks)
                {
                    ApplicationArea = All;
                }
                field(UnitCost; Rec.UnitCost)
                {
                    ApplicationArea = All;
                }
                field("Item Value"; Rec."Item Value")
                {
                    ApplicationArea = All;
                }
                field("Item Category"; Rec."Item Category")
                {
                    ApplicationArea = All;
                }
                field("Product Group Code"; Rec."Product Group Code")
                {
                    ApplicationArea = All;
                }
            }
        }
    }

    actions
    { }
}

