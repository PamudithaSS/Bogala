report 50030 "Item Non Moving Report"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Reports/Item Non Moving Report.rdl';

    dataset
    {
        dataitem("Item Ledger Entry"; "Item Ledger Entry")
        {
            DataItemTableView = SORTING("Item No.", "Posting Date") ORDER(Ascending);
            column(ItemNo; "Item Ledger Entry"."Item No.")
            {
            }
            column(PostingDate; "Item Ledger Entry"."Posting Date")
            {
            }
            column(Qty; "Item Ledger Entry".Quantity)
            {
            }
            column(FromDate; FromDate)
            {
            }
            column(ToDate; ToDate)
            {
            }
            column(desc; "Item Ledger Entry".Description)
            {
            }
            column(DcoNo; "Item Ledger Entry"."Document No.")
            {
            }
            column(RecItemDescription; RecItem.Description)
            {
            }
            column(CName; RecCompanyInfor.Name)
            {
            }

            trigger OnAfterGetRecord();
            begin
                //Getting Item Details
                IF NOT (RecItem.GET("Item Ledger Entry"."Item No.")) THEN CLEAR(RecItem);
            end;

            trigger OnPreDataItem();
            begin
                //filter values not in given date range
                "Item Ledger Entry".SETFILTER("Posting Date", '<%1 | >%2', FromDate, ToDate);
            end;
        }
    }

    requestpage
    {

        layout
        {
            area(content)
            {
                field("From Date"; FromDate)
                {
                    ApplicationArea = All;
                }
                field("To Date"; ToDate)
                {
                    ApplicationArea = All;
                }
            }
        }

        actions
        {
        }
    }

    labels
    {
    }

    trigger OnPreReport();
    begin
        RecCompanyInfor.GET
    end;

    var
        FromDate: Date;
        ToDate: Date;
        RecItem: Record Item;
        RecCompanyInfor: Record "Company Information";
}

