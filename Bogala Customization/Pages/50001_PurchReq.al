page 50001 "Purchase Requisiton"
{
    PageType = Document;
    RefreshOnActivate = true;
    SourceTable = "Purchase Requisition Header";
    SourceTableView = sorting("Document Type", "Document No.") order(Ascending) where("Document Type" = const(PR));

    layout
    {
        area(content)
        {
            group(General)
            {
                field("Document No."; Rec."Document No.")
                {
                    ApplicationArea = All;
                    trigger OnAssistEdit();
                    begin
                        IF Rec.AssistEdit(xRec) THEN
                            CurrPage.UPDATE;
                    end;
                }
                field("Document Type"; Rec."Document Type")
                {
                    ApplicationArea = All;
                    Visible = false;
                }
                field("Location Code"; Rec."Location Code")
                {
                    ApplicationArea = All;
                }
                field("Prepared By"; Rec."Prepared By")
                {
                    ApplicationArea = All;
                }
                field(Department; Rec.Department)
                {
                    ApplicationArea = All;
                }
                field("Document Date"; Rec."Document Date")
                {
                    ApplicationArea = All;
                }
                field("Consignment Invoice No."; Rec."Consignment Invoice No.")
                {
                    ApplicationArea = All;
                }
                field("Reference Order"; Rec."Reference Order")
                {
                    ApplicationArea = All;
                }
                field("Reference PN No."; Rec."Reference PN No.")
                {
                    ApplicationArea = All;
                }
                field("Shortcut Dimension 2 Code"; Rec."Shortcut Dimension 2 Code")
                {
                    ApplicationArea = All;
                }
                field("Items Required Date"; Rec."Items Required Date")
                {
                    ApplicationArea = All;
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = All;
                }
                field(Name; Rec.Name)
                {
                    Visible = true;
                    ApplicationArea = All;
                }
                field("Forecasted Week of Use"; Rec."Forecasted Week of Use")
                {
                    Visible = false;
                    ApplicationArea = All;
                }
                field("No. Series"; Rec."No. Series")
                {
                    Visible = false;
                    ApplicationArea = All;
                }
                field(Criticality; Rec.Criticality)
                {
                    Visible = true;
                    ApplicationArea = All;
                }
                field("Purchase Order No."; Rec."Purchase Order No.")
                {
                    ApplicationArea = All;
                }
                field(Status; Rec.Status)
                {
                    Editable = false;
                    Enabled = false;
                    ApplicationArea = All;
                }
                field("PR Type"; Rec."PR Type")
                {
                    Visible = false;
                    ApplicationArea = All;
                }
                field("Item Category"; Rec."Item Category")
                {
                    Visible = false;
                    ApplicationArea = All;
                }
                field("Product Group"; Rec."Product Group")
                {
                    Visible = false;
                    ApplicationArea = All;
                }
                field("Asset Location"; Rec."Asset Location")
                {
                    Visible = false;
                    ApplicationArea = All;
                }
                field("Shortcut Dimension 1 Code"; Rec."Shortcut Dimension 1 Code")
                {
                    Visible = false;
                    ApplicationArea = All;
                }
                field(Amount; Rec.Amount)
                {
                    Visible = false;
                    ApplicationArea = All;
                }
                field("Asset Category"; Rec."Asset Category")
                {
                    Visible = false;
                    ApplicationArea = All;
                }
                field("FA Class Code"; Rec."FA Class Code")
                {
                    Visible = false;
                    ApplicationArea = All;
                }
                field("FA SubClass Code"; Rec."FA SubClass Code")
                {
                    Visible = false;
                    ApplicationArea = All;
                }
                field("G/L Account No."; Rec."G/L Account No.")
                {
                    Visible = false;
                    ApplicationArea = All;
                }
                field("Reason Code"; Rec."Reason Code")
                {
                    Visible = false;
                    ApplicationArea = All;
                }
                field("Requisition Flag"; Rec."Requisition Flag")
                {
                    Visible = false;
                    ApplicationArea = All;
                }
                field("Currency Code"; Rec."Currency Code")
                {
                    Visible = false;
                    ApplicationArea = All;
                }
                field("PO. Created"; Rec."PO. Created")
                {
                    Visible = false;
                    ApplicationArea = All;
                }
            }
            part("Purchase Requisition"; "Purchase Requisition Subform")
            {
                SubPageLink = "Document No." = FIELD("Document No."), "Document Type" = const(PR);
                ApplicationArea = All;
            }
        }
    }

    actions
    {
        area(processing)
        {
            action(Release)
            {
                ApplicationArea = All;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;

                trigger OnAction();
                begin
                    Rec.TESTFIELD(Status, Rec.Status::Open);
                    Rec.TESTFIELD("Shortcut Dimension 2 Code");
                    Rec.TESTFIELD("Items Required Date");
                    Rec.TESTFIELD("Purchase Order No.");
                    PurchReqLine.RESET;
                    PurchReqLine.SETRANGE("Document Type", Rec."Document Type");
                    PurchReqLine.SETRANGE("Document No.", Rec."Document No.");
                    IF NOT PurchReqLine.FINDSET THEN
                        ERROR(Text003)
                    ELSE
                        REPEAT
                            PurchReqLine.TESTFIELD("No.");
                            PurchReqLine.TESTFIELD(Quantity);
                        UNTIL PurchReqLine.NEXT = 0;

                    IF (Rec."Items Required Date" < Rec."Document Date") THEN
                        ERROR(Text004);
                    Rec.Status := Rec.Status::Released;
                    Rec.MODIFY;
                end;
            }
            action(Reopen)
            {
                ApplicationArea = All;
                Promoted = true;
                PromotedCategory = Process;

                trigger OnAction();
                begin
                    Rec.TESTFIELD("PO. Created", FALSE);
                    Rec.TESTFIELD(Status, Rec.Status::Released);
                    Rec.Status := Rec.Status::Open;
                    Rec.MODIFY;
                end;
            }
        }
    }

    trigger OnAfterGetCurrRecord();
    begin
        TempStatus := Rec."Reason Code";
    end;

    trigger OnAfterGetRecord();
    begin
        Rec.SETRANGE("Document Type");
    end;

    trigger OnFindRecord(Which: Text): Boolean;
    begin
        IF Rec.FIND(Which) THEN
            EXIT(TRUE)
        ELSE BEGIN
            Rec.SETRANGE("Document No.");
            EXIT(Rec.FIND(Which));
        END;
    end;

    trigger OnNewRecord(BelowxRec: Boolean);
    begin
        Rec."Document Type" := Rec."Document Type"::PR;
        Rec."Document Date" := TODAY;
    end;

    var
        recItemBudgetName: Record "G/L Budget Name";
        recItemBudgetEntry: Record "G/L Budget Entry";
        TempStatus: Code[20];
        PurchReqLine: Record "Purchase Requistion Lines";
        Text003: Label 'Nothing to Release';
        Text004: Label 'The item required date should be greater than document date';
}

