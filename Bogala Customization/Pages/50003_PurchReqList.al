page 50003 "Purchase Requistion List"
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = "Purchase Requisition Header";
    CardPageID = "Purchase Requisiton";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Document No."; Rec."Document No.")
                {
                    ApplicationArea = All;
                }
                field("Document Type"; Rec."Document Type")
                {
                    ApplicationArea = All;
                }
                field("Document Date"; Rec."Document Date")
                {
                    ApplicationArea = All;
                }
                field(Name; Rec.Name)
                {
                    ApplicationArea = All;
                }
                field("Forecasted Week of Use"; Rec."Forecasted Week of Use")
                {
                    ApplicationArea = All;
                }
                field("No. Series"; Rec."No. Series")
                {
                    ApplicationArea = All;
                }
                field("Purchase Order No."; Rec."Purchase Order No.")
                {
                    ApplicationArea = All;
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = All;
                }
                field("PR Type"; Rec."PR Type")
                {
                    ApplicationArea = All;
                }
                field("Item Category"; Rec."Item Category")
                {
                    ApplicationArea = All;
                }
                field(Criticality; Rec.Criticality)
                {
                    ApplicationArea = All;
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = All;
                }
                field("Product Group"; Rec."Product Group")
                {
                    ApplicationArea = All;
                }
                field("Asset Location"; Rec."Asset Location")
                {
                    ApplicationArea = All;
                }
                field("Shortcut Dimension 1 Code"; Rec."Shortcut Dimension 1 Code")
                {
                    ApplicationArea = All;
                }
                field("Shortcut Dimension 2 Code"; Rec."Shortcut Dimension 2 Code")
                {
                    ApplicationArea = All;
                }
                field(Amount; Rec.Amount)
                {
                    ApplicationArea = All;
                }
                field("Asset Category"; Rec."Asset Category")
                {
                    ApplicationArea = All;
                }
                field("FA Class Code"; Rec."FA Class Code")
                {
                    ApplicationArea = All;
                }
                field("FA SubClass Code"; Rec."FA SubClass Code")
                {
                    ApplicationArea = All;
                }
                field("G/L Account No."; Rec."G/L Account No.")
                {
                    ApplicationArea = All;
                }
                field("Reason Code"; Rec."Reason Code")
                {
                    ApplicationArea = All;
                }
                field("Items Required Date"; Rec."Items Required Date")
                {
                    ApplicationArea = All;
                }
                field("Requisition Flag"; Rec."Requisition Flag")
                {
                    ApplicationArea = All;
                }
                field("Currency Code"; Rec."Currency Code")
                {
                    ApplicationArea = All;
                }
                field("Location Code"; Rec."Location Code")
                {
                    ApplicationArea = All;
                }
                field("Prepared By"; Rec."Prepared By")
                {
                    ApplicationArea = All;
                }
                field("Prepared On"; Rec."Prepared On")
                {
                    ApplicationArea = All;
                }
                field("PO. Created"; Rec."PO. Created")
                {
                    ApplicationArea = All;
                }
            }
        }
    }

    actions
    {
        area(processing)
        {
            group(Print)
            {
                action("PRN Print out")
                {
                    ApplicationArea = All;
                    Promoted = true;
                    PromotedCategory = "Report";
                    PromotedIsBig = true;
                    RunObject = Report 50001;
                }
            }
        }
    }
}

