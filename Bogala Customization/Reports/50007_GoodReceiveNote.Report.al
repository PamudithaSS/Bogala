report 50007 "Good Receive Note"
{
    //DefaultLayout = RDLC;
    RDLCLayout = './Reports/Good Receive Note.rdl';

    dataset
    {
        dataitem("Purch. Rcpt. Header"; "Purch. Rcpt. Header")
        {
            DataItemTableView = SORTING("No.") ORDER(Ascending);
            RequestFilterFields = "No.";
            column(No; "Purch. Rcpt. Header"."No.")
            { }
            column(PostingDate; "Purch. Rcpt. Header"."Posting Date")
            { }
            column(OrderNo; "Purch. Rcpt. Header"."Order No.")
            { }
            column(BuyfromVendorName; "Purch. Rcpt. Header"."Buy-from Vendor Name")
            { }
            column(VendorShipmentNo; "Purch. Rcpt. Header"."Vendor Shipment No.")
            { }
            column(CompanyName; Companyinfo.Name)
            { }
            column(CompanyAddress; Companyinfo.Address)
            { }
            column(CompanyAddress2; Companyinfo."Address 2")
            { }
            column(CompanyCity; Companyinfo.City)
            { }
            column(CompanyPhoneNo; Companyinfo."Phone No.")
            { }
            column(CompanyFaxNo; Companyinfo."Fax No.")
            { }
            dataitem("Purch. Rcpt. Line"; "Purch. Rcpt. Line")
            {
                DataItemLink = "Document No." = FIELD("No.");
                DataItemTableView = SORTING("Document No.", "Line No.") ORDER(Ascending);
                column(PostingGroup; "Purch. Rcpt. Line"."Posting Group")
                { }
                column(ItemCode; "Purch. Rcpt. Line"."No.")
                { }
                column(UnitofMeasureCode; "Purch. Rcpt. Line"."Unit of Measure Code")
                { }
                column(DirectUnitCost; "Purch. Rcpt. Line"."Direct Unit Cost")
                { }
                column(Quantity; "Purch. Rcpt. Line".Quantity)
                { }
                column(RcptDocumentNo; "Purch. Rcpt. Line"."Document No.")
                { }
                column(LineNo; "Purch. Rcpt. Line"."Line No.")
                { }
                column(PostingGroupDescription; recPostingGroup.Description)
                { }
                column(SingleBusinessUnitCode; "Purch. Rcpt. Line"."Shortcut Dimension 1 Code")
                { }
                column(CostCentreCode; "Purch. Rcpt. Line"."Shortcut Dimension 2 Code")
                { }

                trigger OnAfterGetRecord()
                begin
                    recPostingGroup.RESET;
                    recPostingGroup.SETRANGE(recPostingGroup.Code, "Purch. Rcpt. Line"."Posting Group");
                    IF recPostingGroup.FINDFIRST THEN;
                end;
            }
            trigger OnAfterGetRecord();
            begin

                Companyinfo.GET;
            end;
        }
    }
    var
        recPostingGroup: Record "Inventory Posting Group";
        Companyinfo: Record "Company Information";
}

