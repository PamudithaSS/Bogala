pageextension 50018 PurchaseOrder extends "Purchase Order"
{
    layout
    {
        //movebefore("Document Date"; "Tax Liable")
        addafter("Quote No.")
        {
            field("Your Reference"; Rec."Your Reference")
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
        addafter("Vendor Invoice No.")
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
            field("Approval Entry"; Rec."Approval Entry")
            {
                ApplicationArea = All;
            }
            field("Created User"; Rec."Created User")
            {
                ApplicationArea = All;
            }
            field("No. Series"; Rec."No. Series")
            {
                ApplicationArea = All;
            }
            field(Remarks; Rec.Remarks)
            {
                ApplicationArea = All;
            }
        }
        addbefore("Tax Liable")
        {
            field("Tax Group"; Rec."Tax Group")
            {
                ApplicationArea = All;
            }
        }
        addafter("Ship-to Code")
        {
            field("Part Shipment"; Rec."Part Shipment")
            {
                ApplicationArea = All;
            }
            field("Delivery Details"; Rec."Delivery Details")
            {
                ApplicationArea = All;
            }
            field("Shiipping Marks"; Rec."Shiipping Marks")
            {
                ApplicationArea = All;
            }
        }
        modify("Posting Date")
        {
            trigger OnAfterValidate()
            begin
                IF (Rec."Posting Date" < Rec."Order Date") THEN
                    ERROR('Posting date is greater than the Order date.');
            end;
        }
        addlast(General)
        {
            field("Approver User ID"; Rec."Approve User ID")
            {
                ApplicationArea = All;
                Editable = edit;
            }
        }
        modify("Quote No.")
        {
            Importance = Promoted;
        }
        modify("Purchaser Code")
        {
            Importance = Promoted;
        }
        modify("Buy-from Contact No.")
        {
            Visible = false;
        }
        modify("Buy-from Address")
        {
            Visible = false;
        }
        modify("Buy-from Address 2")
        {
            Visible = false;
        }
        modify("Buy-from Post Code")
        {
            Visible = false;
        }
        modify("Buy-from City")
        {
            Visible = false;
        }
        modify("Buy-from Contact")
        {
            Visible = false;
        }
        modify("Pay-to Contact No.")
        {
            Visible = false;
        }
        modify("Pay-to Address")
        {
            Visible = false;
        }
        modify("Pay-to Address 2")
        {
            Visible = false;
        }
        modify("Pay-to Post Code")
        {
            Visible = false;
        }
        modify("Pay-to City")
        {
            Visible = false;
        }
        modify("Pay-to Contact")
        {
            Visible = false;
        }
        modify("Ship-to Address 2")
        {
            Visible = false;
        }
        modify("Ship-to Post Code")
        {
            Visible = false;
        }
        modify("Ship-to City")
        {
            Visible = false;
        }
        modify("Ship-to Contact")
        {
            Visible = false;
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

    actions
    {
        addafter("&Print")
        {
            action(PrintForeignPO)
            {
                Image = PrintReport;
                Caption = 'Print Foreign PO';
                Promoted = true;
                PromotedCategory = Report;
                PromotedIsBig = true;
                PromotedOnly = true;
                ApplicationArea = All;

                trigger OnAction()
                var
                    PurchHeader: Record "Purchase Header";
                begin
                    IF Rec."No. Series" IN ['PO F NEW'] THEN begin
                        Clear(PurchHeader);
                        PurchHeader.SetRange("Document Type", Rec."Document Type");
                        PurchHeader.SetRange("No.", Rec."No.");
                        REPORT.RUNMODAL(50016, TRUE, FALSE, PurchHeader)
                    end;
                end;
            }
            action(PrintLocalPO)
            {
                Image = PrintReport;
                Caption = 'Print Local PO';
                Promoted = true;
                PromotedCategory = Report;
                PromotedIsBig = true;
                PromotedOnly = true;
                ApplicationArea = All;

                trigger OnAction()
                var
                    PurchHeader: Record "Purchase Header";
                begin
                    IF Rec."No. Series" IN ['PO L HO', 'PO MINE', ''] THEN begin
                        Clear(PurchHeader);
                        PurchHeader.SetRange("Document Type", Rec."Document Type");
                        PurchHeader.SetRange("No.", Rec."No.");
                        REPORT.RUNMODAL(50017, TRUE, FALSE, PurchHeader);
                    end;
                end;
            }
            action(PrintServicePO)
            {
                Image = PrintReport;
                Caption = 'Print Service PO';
                Promoted = true;
                PromotedCategory = Report;
                PromotedIsBig = true;
                PromotedOnly = true;
                ApplicationArea = All;

                trigger OnAction()
                var
                    PurchHeader: Record "Purchase Header";
                begin
                    IF Rec."No. Series" IN ['PO SER FOR', 'PO SER M', 'PO SERVICE', 'MSOOH'] THEN begin
                        Clear(PurchHeader);
                        PurchHeader.SetRange("Document Type", Rec."Document Type");
                        PurchHeader.SetRange("No.", Rec."No.");
                        REPORT.RUNMODAL(50018, TRUE, FALSE, PurchHeader);
                    end;
                end;
            }
        }
        modify(SendApprovalRequest)
        {
            trigger OnBeforeAction()
            var
                myInt: Integer;
            begin
                if Rec."Approve User ID" = '' then begin
                    Error('Approver User ID must have a value');
                end;
            end;
        }
    }
    var
        edit: Boolean;

    trigger OnOpenPage()
    begin
        if Rec.Status = Rec.Status::Open then
            edit := true
        else
            edit := false;
    end;
}