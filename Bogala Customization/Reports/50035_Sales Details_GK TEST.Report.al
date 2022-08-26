report 50035 "Sales Details_GK TEST"
{
    // version DH-JIT

    // Initiation on 22/11/2013 done by Vidura-JIT
    // Customization on 23/11/2016 under JCS-0002-DH-0001 done by DH-JIT

    ProcessingOnly = true;

    dataset
    {
        dataitem("Sales Invoice Header"; "Sales Invoice Header")
        {
            DataItemTableView = SORTING("Posting Date")
                                WHERE("Gen. Bus. Posting Group" = CONST('EXPORT'));
            dataitem("Sales Invoice Line"; "Sales Invoice Line")
            {
                DataItemLink = "Document No." = FIELD("No.");
                DataItemTableView = SORTING("Document No.", "Line No.") ORDER(Ascending) WHERE(Type = CONST(Item));

                trigger OnAfterGetRecord();
                var
                    txtCurrencyCode2: Text[30];
                begin
                    Cust_.RESET;
                    Cust_.SETFILTER("No.", "Sales Invoice Line"."Sell-to Customer No.");
                    Cust_.FINDFIRST;
                    Row := Row + 1;
                    EnterCell(Row, 1, "Sales Invoice Line"."Sell-to Customer No.", FALSE, FALSE, FALSE);
                    EnterCell(Row, 2, Cust_.Name, FALSE, FALSE, FALSE);
                    EnterCell(Row, 3, "Sales Invoice Header"."No.", FALSE, FALSE, FALSE);
                    EnterCell(Row, 4, "Sales Invoice Header"."Salesperson Code", FALSE, FALSE, FALSE);
                    EnterCell(Row, 5, txtDim3CGValue, FALSE, FALSE, FALSE);
                    EnterCell(Row, 6, Description, FALSE, FALSE, FALSE);
                    EnterCell(Row, 7, FORMAT("Posting Date"), FALSE, FALSE, FALSE);
                    EnterCell(Row, 8, FORMAT(Quantity), FALSE, FALSE, FALSE);

                    IF "Sales Invoice Header"."Currency Code" <> '' THEN
                        txtCurrencyCode2 := "Sales Invoice Header"."Currency Code"
                    ELSE
                        txtCurrencyCode2 := txtCurrencyCode;

                    EnterCell(Row, 9, txtCurrencyCode2, FALSE, FALSE, FALSE);
                    EnterCell(Row, 10, FORMAT("Unit Price" + ItemChrg_), FALSE, FALSE, FALSE);
                    EnterCell(Row, 11, FORMAT(("Unit Price" + ItemChrg_) * Quantity), FALSE, FALSE, FALSE);

                    IF decCurrencyFactor = 0 THEN
                        decCurrencyFactor := 1;

                    EnterCell(Row, 12, FORMAT(ROUND((("Unit Price" + ROUND(ItemChrg_, 0.01, '=')) * Quantity) * (1 / decCurrencyFactor), 0.01, '=')), FALSE, FALSE, FALSE);
                    //EnterCell(Row,11,FORMAT("Sales Invoice Line".Quantity*
                    //    ("Sales Invoice Line"."Unit Price"+decTotItemChgLineAmount)),FALSE,FALSE,FALSE);
                    //EnterCell(Row,12,FORMAT(("Sales Invoice Line".Quantity*("Sales Invoice Line"."Unit Price"+decTotItemChgLineAmount))
                    //            *(1/decCurrencyFactor)),FALSE,FALSE,FALSE);
                    RecNo := RecNo + 1;
                    IF TotalRecNo <> 0 THEN
                        Window.UPDATE(1, ROUND(RecNo / TotalRecNo * 10000, 1));
                end;
            }

            trigger OnAfterGetRecord();
            var
                recDefaultDimension: Record "Default Dimension";
                recCustomer: Record Customer;
                recCountry: Record "Country/Region";
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

                //decTotItemChgLineAmount:=0;
                //recSalesInvoiceLine.RESET;
                //recSalesInvoiceLine.SETRANGE("Document No.", "No.");
                //recSalesInvoiceLine.SETRANGE(Type,"Sales Invoice Line".Type::"Charge (Item)");
                //IF recSalesInvoiceLine.FINDFIRST THEN
                //  REPEAT
                //      decTotItemChgLineAmount:=decTotItemChgLineAmount+recSalesInvoiceLine."Unit Price";
                //  UNTIL recSalesInvoiceLine.NEXT=0;

                Qty_ := 0; //sriyantha 06_02_2014
                ItemChrg_ := 0;//sriyantha 06_02_2014
                decTotItemChgLineAmount := 0;
                recSalesInvoiceLine.RESET;
                recSalesInvoiceLine.SETRANGE("Document No.", "No.");
                //recSalesInvoiceLine.SETRANGE(Type,"Sales Invoice Line".Type::"Charge (Item)");//sriyantha 06_02_2014
                IF recSalesInvoiceLine.FINDFIRST THEN
                    REPEAT
                        IF recSalesInvoiceLine.Type = "Sales Invoice Line".Type::"Charge (Item)" THEN BEGIN//sriyantha 06_02_2014
                            decTotItemChgLineAmount := decTotItemChgLineAmount + recSalesInvoiceLine."Line Amount";
                            IF Qty_ > 0 THEN
                                ItemChrg_ := decTotItemChgLineAmount / Qty_;//sriyantha 06_02_2014
                        END ELSE
                            IF recSalesInvoiceLine.Type = "Sales Invoice Line".Type::Item THEN //sriyantha 06_02_2014
                                Qty_ += recSalesInvoiceLine.Quantity;  //sriyantha 06_02_2014
                    UNTIL recSalesInvoiceLine.NEXT = 0;
            end;

            trigger OnPostDataItem();
            begin

                Row := Row + 2;
                EnterCell(Row, 1, 'LOCAL', TRUE, FALSE, FALSE);
                RecNo := RecNo + 2;
                IF TotalRecNo <> 0 THEN
                    Window.UPDATE(1, ROUND(RecNo / TotalRecNo * 10000, 1));
            end;

            trigger OnPreDataItem();
            begin

                IF ((date1 <> 0D) AND (date2 <> 0D)) THEN
                    "Sales Invoice Header".SETFILTER("Posting Date", '%1..%2', date1, date2)
                ELSE
                    CurrReport.BREAK;



                Window.OPEN('Data Exporting' + '@1@@@@@@@@@@@@@@@@@@@@@\');
                Window.UPDATE(1, 0);
                TotalRecNo := (2 * ("Sales Invoice Line".COUNTAPPROX)) + ("Sales Cr.Memo Line".COUNTAPPROX);
                RecNo := 0;
                TempExcelBuffer.DELETEALL;
                CLEAR(TempExcelBuffer);
                EnterCell(1, 1, 'Details of Sales  - ' + txtCriteria, TRUE, FALSE, TRUE);
                EnterCell(2, 1, 'Customer No.', TRUE, FALSE, FALSE);
                EnterCell(2, 2, 'Customer Name', TRUE, FALSE, FALSE);
                EnterCell(2, 3, 'Invoice No.', TRUE, FALSE, FALSE);
                EnterCell(2, 4, 'Sales Person', TRUE, FALSE, FALSE);
                EnterCell(2, 5, 'Application', TRUE, FALSE, FALSE);
                EnterCell(2, 6, 'Item No.', TRUE, FALSE, FALSE);
                EnterCell(2, 7, 'Date', TRUE, FALSE, FALSE);
                EnterCell(2, 8, 'Quantity', TRUE, FALSE, FALSE);
                EnterCell(2, 9, 'Currency', TRUE, FALSE, FALSE);
                EnterCell(2, 10, 'Price', TRUE, FALSE, FALSE);
                EnterCell(2, 11, 'Sales Amount', TRUE, FALSE, FALSE);
                EnterCell(2, 12, 'Value LKR', TRUE, FALSE, TRUE);
                EnterCell(2, 13, 'Sales Order No.', TRUE, FALSE, TRUE);    //----DH-JIT_23/11/2016
                EnterCell(2, 14, 'Customer Order No.', TRUE, FALSE, TRUE); //----DH-JIT_23/11/2016

                Row := 3;

                Row := Row + 1;
                EnterCell(Row, 1, 'EXPORT', TRUE, FALSE, FALSE);
                RecNo := RecNo + 1;
                IF TotalRecNo <> 0 THEN
                    Window.UPDATE(1, ROUND(RecNo / TotalRecNo * 10000, 1));
            end;
        }
        dataitem("<Sales Invoice Header1>"; "Sales Invoice Header")
        {
            DataItemTableView = SORTING("Posting Date") WHERE("Gen. Bus. Posting Group" = CONST('LOCAL'));
            dataitem("<Sales Invoice Line1>"; "Sales Invoice Line")
            {
                DataItemLink = "Document No." = FIELD("No.");
                DataItemTableView = SORTING("Document No.", "Line No.") ORDER(Ascending) WHERE(Type = CONST(Item));

                trigger OnAfterGetRecord();
                var
                    txtCurrencyCode2: Text[30];
                begin
                    Cust_.RESET;
                    Cust_.SETFILTER("No.", "<Sales Invoice Line1>"."Sell-to Customer No.");
                    Cust_.FINDFIRST;

                    Row := Row + 1;
                    EnterCell(Row, 1, "<Sales Invoice Line1>"."Sell-to Customer No.", FALSE, FALSE, FALSE);
                    EnterCell(Row, 2, Cust_.Name, FALSE, FALSE, FALSE);
                    EnterCell(Row, 3, "<Sales Invoice Header1>"."No.", FALSE, FALSE, FALSE);
                    EnterCell(Row, 4, "<Sales Invoice Header1>"."Salesperson Code", FALSE, FALSE, FALSE);
                    EnterCell(Row, 5, txtDim3CGValue, FALSE, FALSE, FALSE);
                    EnterCell(Row, 6, Description, FALSE, FALSE, FALSE);
                    EnterCell(Row, 7, FORMAT("Posting Date"), FALSE, FALSE, FALSE);
                    EnterCell(Row, 8, FORMAT(Quantity), FALSE, FALSE, FALSE);

                    IF "<Sales Invoice Header1>"."Currency Code" <> '' THEN
                        txtCurrencyCode2 := "Sales Invoice Header"."Currency Code"
                    ELSE
                        txtCurrencyCode2 := txtCurrencyCode;

                    EnterCell(Row, 9, txtCurrencyCode2, FALSE, FALSE, FALSE);
                    EnterCell(Row, 10, FORMAT("Unit Price" + ItemChrg_), FALSE, FALSE, FALSE);
                    EnterCell(Row, 11, FORMAT(("Unit Price" + ItemChrg_) * Quantity), FALSE, FALSE, FALSE);

                    IF decCurrencyFactor = 0 THEN
                        decCurrencyFactor := 1;

                    //EnterCell(Row,12,FORMAT((("Unit Price"+ItemChrg_)*Quantity)*(1/decCurrencyFactor)),FALSE,FALSE,FALSE);
                    EnterCell(Row, 12, FORMAT(ROUND((("Unit Price" + ROUND(ItemChrg_, 0.01, '=')) * Quantity) * (1 / decCurrencyFactor), 0.01, '=')), FALSE, FALSE, FALSE);
                    //EnterCell(Row,11,FORMAT("Sales Invoice Line".Quantity*
                    //    ("Sales Invoice Line"."Unit Price"+decTotItemChgLineAmount)),FALSE,FALSE,FALSE);
                    //EnterCell(Row,12,FORMAT(("Sales Invoice Line".Quantity*("Sales Invoice Line"."Unit Price"+decTotItemChgLineAmount))
                    //            *(1/decCurrencyFactor)),FALSE,FALSE,FALSE);

                    EnterCell(Row, 17, FORMAT("Sales Invoice Header"."Order No."), FALSE, FALSE, FALSE);                //----DH-JIT_23/11/2016
                    EnterCell(Row, 18, FORMAT("Sales Invoice Header"."Customer Order Number."), FALSE, FALSE, FALSE);   //----DH-JIT_23/11/2016

                    RecNo := RecNo + 1;
                    IF TotalRecNo <> 0 THEN
                        Window.UPDATE(1, ROUND(RecNo / TotalRecNo * 10000, 1));
                end;
            }

            trigger OnAfterGetRecord();
            var
                recDefaultDimension: Record "Default Dimension";
                recCustomer: Record Customer;
                recCountry: Record "Country/Region";
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

                Qty_ := 0; //sriyantha 06_02_2014
                ItemChrg_ := 0;//sriyantha 06_02_2014
                decTotItemChgLineAmount := 0;
                recSalesInvoiceLine.RESET;
                recSalesInvoiceLine.SETRANGE("Document No.", "No.");
                IF recSalesInvoiceLine.FINDFIRST THEN
                    REPEAT
                        IF recSalesInvoiceLine.Type = "Sales Invoice Line".Type::"Charge (Item)" THEN BEGIN//sriyantha 06_02_2014
                            decTotItemChgLineAmount := decTotItemChgLineAmount + recSalesInvoiceLine."Line Amount";
                            IF Qty_ > 0 THEN
                                ItemChrg_ := decTotItemChgLineAmount / Qty_;//sriyantha 06_02_2014
                        END ELSE
                            IF recSalesInvoiceLine.Type = "Sales Invoice Line".Type::Item THEN //sriyantha 06_02_2014
                                Qty_ += recSalesInvoiceLine.Quantity;  //sriyantha 06_02_2014
                    UNTIL recSalesInvoiceLine.NEXT = 0;
            end;

            trigger OnPostDataItem();
            begin

                Row := Row + 3;
                EnterCell(Row, 1, 'DETAILS LINES OF CREDIT MEMOS', TRUE, FALSE, FALSE);
                RecNo := RecNo + 3;
                IF TotalRecNo <> 0 THEN
                    Window.UPDATE(1, ROUND(RecNo / TotalRecNo * 10000, 1));
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
            DataItemTableView = SORTING("Posting Date") ORDER(Ascending);
            dataitem("Sales Cr.Memo Line"; "Sales Cr.Memo Line")
            {
                DataItemLinkReference = "Sales Cr.Memo Header";
                DataItemLink = "Document No." = FIELD("No.");
                // DataItemTableView = SORTING("Document No.", "Line No.") WHERE(Type = FILTER(Item | ' ' | 'Charge (Item)'));
                DataItemTableView = SORTING("Document No.", "Line No.") WHERE(Type = FILTER(Item | " " | "Charge (Item)")); //PS
                trigger OnAfterGetRecord();
                begin

                    Row := Row + 1;
                    EnterCell(Row, 1, FORMAT("Posting Date"), FALSE, FALSE, FALSE);
                    EnterCell(Row, 3, "Gen. Bus. Posting Group", FALSE, FALSE, FALSE);
                    EnterCell(Row, 4, "Sales Cr.Memo Header"."Sell-to Customer Name", FALSE, FALSE, FALSE);
                    EnterCell(Row, 7, "Sales Cr.Memo Line"."Document No.", FALSE, FALSE, FALSE);
                    EnterCell(Row, 8, "Sales Cr.Memo Line".Description, FALSE, FALSE, FALSE);
                    EnterCell(Row, 9, "Sales Cr.Memo Line"."Description 2", FALSE, FALSE, FALSE);
                    EnterCell(Row, 11, "Sales Cr.Memo Header"."Currency Code", FALSE, FALSE, FALSE);
                    EnterCell(Row, 12, FORMAT("Sales Cr.Memo Line".Quantity), FALSE, FALSE, FALSE);
                    EnterCell(Row, 13, FORMAT("Sales Cr.Memo Line"."Unit Price"), FALSE, FALSE, FALSE);
                    EnterCell(Row, 14, FORMAT("Sales Cr.Memo Line"."Line Amount"), FALSE, FALSE, FALSE);
                    RecNo := RecNo + 1;
                    IF TotalRecNo <> 0 THEN
                        Window.UPDATE(1, ROUND(RecNo / TotalRecNo * 10000, 1));
                end;
            }

            trigger OnPostDataItem();
            begin

                Window.CLOSE;
                // TempExcelBuffer.CreateBook('Details of Sales');
                // TempExcelBuffer.CreateBookAndOpenExcel('Details of Sales', 'Details of Sales', COMPANYNAME, USERID);
                TempExcelBuffer.CreateNewBook('Details of Sales');
                TempExcelBuffer.WriteSheet('Details of Sales', COMPANYNAME, USERID);
                TempExcelBuffer.CloseBook();
                TempExcelBuffer.SetFriendlyFilename(StrSubstNo('Details of Sales %1 & &2', CurrentDateTime, UserId));
                TempExcelBuffer.OpenExcel();
            end;

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
            area(content)
            {
                group(Group)
                {
                    field(date1; date1)
                    {
                        ApplicationArea = All;
                        Caption = 'From Date';
                    }
                    field(date2; date2)
                    {
                        ApplicationArea = All;
                        Caption = 'To Date';
                    }
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
        TempExcelBuffer: Record "Excel Buffer";
        Window: Dialog;
        Row: Integer;
        TotalRecNo: BigInteger;
        RecNo: Integer;
        recSalesInvoiceLine: Record "Sales Invoice Line";
        decTotItemChgLineAmount: Decimal;
        txtCriteria: Text[250];
        recDimVal: Record "Dimension Value";
        txtCurrencyCode: Text[30];
        recGLSetup: Record "General Ledger Setup";
        date1: Date;
        date2: Date;
        Cust_: Record Customer;
        Qty_: Decimal;
        ItemChrg_: Decimal;

    procedure EnterCell(RowNo: Integer; ColumnNo: Integer; CellValue: Text[250]; Bold: Boolean; Italic: Boolean; Underline: Boolean);
    begin
        WITH TempExcelBuffer DO BEGIN
            INIT;
            VALIDATE("Row No.", RowNo);
            VALIDATE("Column No.", ColumnNo);
            "Cell Value as Text" := CellValue;
            Formula := '';
            Bold := Bold;
            Italic := Italic;
            Underline := Underline;
            INSERT;
        END
    end;
}

