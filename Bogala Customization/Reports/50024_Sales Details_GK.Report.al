report 50024 "Sales Details_GK"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Reports/Sales Details_GK.rdl';

    dataset
    {
        dataitem("Sales Invoice Header"; "Sales Invoice Header")
        {
            DataItemTableView = SORTING("Posting Date") WHERE("Gen. Bus. Posting Group" = CONST('EXPORT'));
            column(SalesInvoiceHeaderSelltoCustomerNo; "Sales Invoice Header"."Sell-to Customer No.")
            {
            }
            column(SalesInvoiceHeaderSalespersonCode; "Sales Invoice Header"."Salesperson Code")
            {
            }
            column(txtDim4AppValue; txtDim4AppValue)
            {
            }
            column(SalesInvoiceHeaderPostingDate; "Sales Invoice Header"."Posting Date")
            {
            }
            column(SalesInvoiceHeaderCurrencyCode; "Sales Invoice Header"."Currency Code")
            {
            }
            dataitem("Sales Invoice Line"; "Sales Invoice Line")
            {
                DataItemLink = "Document No." = FIELD("No.");
                DataItemTableView = SORTING("Document No.", "Line No.") ORDER(Ascending) WHERE(Type = CONST(Item));
                column(SalesInvoiceLineNo; "Sales Invoice Line"."No.")
                {
                }
                column(SalesInvoiceLineQuantity; "Sales Invoice Line".Quantity)
                {
                }
                column(SalesInvoiceLineUnitPrice; "Sales Invoice Line"."Unit Price")
                {
                }

                trigger OnAfterGetRecord();
                begin

                    IF "Sales Invoice Header"."Currency Code" <> '' THEN
                        txtCurrencyCode2 := "Sales Invoice Header"."Currency Code"
                    ELSE
                        txtCurrencyCode2 := txtCurrencyCode;


                    IF decCurrencyFactor = 0 THEN
                        decCurrencyFactor := 1;
                end;
            }

            trigger OnAfterGetRecord();
            begin

                IF "Sales Invoice Header"."Currency Factor" <= 0 THEN
                    decCurrencyFactor := 1.0
                ELSE
                    decCurrencyFactor := "Sales Invoice Header"."Currency Factor";

                WITH recDefaultDimension DO BEGIN
                    RESET;
                    SETRANGE("Table ID", 18);
                    SETRANGE("No.", "Sales Invoice Header"."Sell-to Customer No.");
                    IF FINDFIRST THEN
                        REPEAT
                            recDimVal.RESET;
                            recDimVal.SETRANGE("Dimension Code", recDefaultDimension."Dimension Code");
                            recDimVal.SETRANGE(Code, recDefaultDimension."Dimension Value Code");
                            IF recDimVal.FINDFIRST THEN
                                CASE "Dimension Code" OF
                                    'APPLICATION':
                                        txtDim3CGValue := recDimVal.Name;

                                    'CUSTOMERGROUP':
                                        txtDim4AppValue := recDimVal.Name;
                                END

                        UNTIL NEXT = 0;

                END;

                IF recCustomer.GET("Sales Invoice Header"."Sell-to Customer No.") THEN
                    IF NOT (recCustomer."Country/Region Code" = '') THEN
                        IF recCountry.GET(recCustomer."Country/Region Code") THEN
                            txtCountryName := recCountry.Name;

                decTotItemChgLineAmount := 0;
                recSalesInvoiceLine.RESET;
                recSalesInvoiceLine.SETRANGE("Document No.", "No.");
                recSalesInvoiceLine.SETRANGE(Type, "Sales Invoice Line".Type::"Charge (Item)");
                IF recSalesInvoiceLine.FINDFIRST THEN
                    REPEAT
                        decTotItemChgLineAmount := decTotItemChgLineAmount + recSalesInvoiceLine."Unit Price";
                    UNTIL recSalesInvoiceLine.NEXT = 0;
            end;

            trigger OnPreDataItem();
            begin

                IF ((date1 <> 0D) AND (date2 <> 0D)) THEN
                    "Sales Invoice Header".SETFILTER("Posting Date", '%1..%2', date1, date2)
                ELSE
                    CurrReport.BREAK;
            end;
        }
        dataitem("<Sales Invoice Header1>"; "Sales Invoice Header")
        {
            dataitem("<Sales Invoice Line1>"; "Sales Invoice Line")
            {

                trigger OnAfterGetRecord();
                begin

                    IF "<Sales Invoice Header1>"."Currency Code" <> '' THEN
                        txtCurrencyCode2 := "Sales Invoice Header"."Currency Code"
                    ELSE
                        txtCurrencyCode2 := txtCurrencyCode;

                    IF decCurrencyFactor = 0 THEN
                        decCurrencyFactor := 1;
                end;
            }

            trigger OnAfterGetRecord();
            begin

                IF "<Sales Invoice Header1>"."Currency Factor" <= 0 THEN
                    decCurrencyFactor := 1.0
                ELSE
                    decCurrencyFactor := "<Sales Invoice Header1>"."Currency Factor";

                WITH recDefaultDimension DO BEGIN
                    RESET;
                    SETRANGE("Table ID", 18);
                    SETRANGE("No.", "<Sales Invoice Header1>"."Sell-to Customer No.");
                    IF FINDFIRST THEN
                        REPEAT
                            recDimVal.RESET;
                            recDimVal.SETRANGE("Dimension Code", recDefaultDimension."Dimension Code");
                            recDimVal.SETRANGE(Code, recDefaultDimension."Dimension Value Code");
                            IF recDimVal.FINDFIRST THEN
                                CASE "Dimension Code" OF
                                    'APPLICATION':
                                        txtDim3CGValue := recDimVal.Name;

                                    'CUSTOMERGROUP':
                                        txtDim4AppValue := recDimVal.Name;
                                END

                        UNTIL NEXT = 0;

                END;

                IF recCustomer.GET("<Sales Invoice Header1>"."Sell-to Customer No.") THEN
                    IF NOT (recCustomer."Country/Region Code" = '') THEN
                        IF recCountry.GET(recCustomer."Country/Region Code") THEN
                            txtCountryName := recCountry.Name;

                decTotItemChgLineAmount := 0;
                recSalesInvoiceLine.RESET;
                recSalesInvoiceLine.SETRANGE("Document No.", "No.");
                recSalesInvoiceLine.SETRANGE(Type, "<Sales Invoice Line1>".Type::"Charge (Item)");
                IF recSalesInvoiceLine.FINDFIRST THEN
                    REPEAT
                        decTotItemChgLineAmount := decTotItemChgLineAmount + recSalesInvoiceLine."Unit Price";
                    UNTIL recSalesInvoiceLine.NEXT = 0;
            end;

            trigger OnPreDataItem();
            begin

                IF ((date1 <> 0D) AND (date2 <> 0D)) THEN
                    "<Sales Invoice Header1>".SETFILTER("Posting Date", '%1..%2', date1, date2)
                ELSE
                    CurrReport.BREAK;
            end;
        }
        dataitem("Sales Cr.Memo Header"; "Sales Cr.Memo Header")
        {
            dataitem("Sales Cr.Memo Line"; "Sales Cr.Memo Line")
            {
            }

            trigger OnPreDataItem();
            begin

                IF ((date1 <> 0D) AND (date2 <> 0D)) THEN
                    "Sales Cr.Memo Header".SETFILTER("Posting Date", '%1..%2', date1, date2)
                ELSE
                    CurrReport.BREAK;
            end;
        }
    }

    requestpage
    {

        layout
        {
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

        txtCriteria := 'Date Range :' + FORMAT(date1) + ' ' + FORMAT(date2);

        IF recGLSetup.GET THEN
            txtCurrencyCode := recGLSetup."LCY Code";

        IF "Sales Invoice Header".GETFILTER("Posting Date") <> '' THEN
            "<Sales Invoice Header1>"."Posting Date" := "Sales Invoice Header"."Posting Date";
    end;

    var
        decCurrencyFactor: Decimal;
        txtDim3CGValue: Text[50];
        txtDim4AppValue: Text[50];
        txtCountryName: Text[50];
        recSalesInvoiceLine: Record "Sales Invoice Line";
        decTotItemChgLineAmount: Decimal;
        txtCriteria: Text;
        recDimVal: Record "Dimension Value";
        txtCurrencyCode: Text;
        recGLSetup: Record "General Ledger Setup";
        date1: Date;
        date2: Date;
        recDefaultDimension: Record "Default Dimension";
        recCustomer: Record Customer;
        recCountry: Record "Country/Region";
        txtCurrencyCode2: Text;
}

