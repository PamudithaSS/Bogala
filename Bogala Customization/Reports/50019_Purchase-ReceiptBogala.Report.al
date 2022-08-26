report 50019 "Purchase - Receipt Bogala"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Reports/Purchase - Receipt Bogala.rdl';
    Caption = 'Purchase - Receipt';

    dataset
    {
        dataitem("Purch. Rcpt. Header"; "Purch. Rcpt. Header")
        {
            DataItemTableView = SORTING("No.");
            RequestFilterFields = "No.", "Buy-from Vendor No.", "No. Printed";
            //ReqFilterHeading = 'Posted Purchase Receipt';
            column(No_PurchRcptHeader; "No.")
            { }
            column(DocDateCaption; DocDateCaptionLbl)
            { }
            column(PageCaption; PageCaptionLbl)
            { }
            column(DescCaption; DescCaptionLbl)
            { }
            column(QtyCaption; QtyCaptionLbl)
            { }
            column(UOMCaption; UOMCaptionLbl)
            { }
            column(PaytoVenNoCaption; PaytoVenNoCaptionLbl)
            { }
            column(EmailCaption; EmailCaptionLbl)
            { }
            dataitem(CopyLoop; Integer)
            {
                DataItemTableView = SORTING(Number);
                dataitem(PageLoop; Integer)
                {
                    DataItemTableView = SORTING(Number)
                                        WHERE(Number = CONST(1));
                    column(PurchRcptCopyText; STRSUBSTNO(Text002, CopyText))
                    { }
                    column(CurrentReportPageNo; STRSUBSTNO(Text003, FORMAT(CurrReport.PAGENO)))
                    { }
                    column(ShipToAddr1; ShipToAddr[1])
                    { }
                    column(CompanyAddr1; CompanyAddr[1])
                    { }
                    column(ShipToAddr2; ShipToAddr[2])
                    { }
                    column(CompanyAddr2; CompanyAddr[2])
                    { }
                    column(ShipToAddr3; ShipToAddr[3])
                    { }
                    column(CompanyAddr3; CompanyAddr[3])
                    { }
                    column(ShipToAddr4; ShipToAddr[4])
                    { }
                    column(CompanyAddr4; CompanyAddr[4])
                    { }
                    column(ShipToAddr5; ShipToAddr[5])
                    { }
                    column(CompanyInfoPhoneNo; CompanyInfo."Phone No.")
                    { }
                    column(ShipToAddr6; ShipToAddr[6])
                    { }
                    column(CompanyInfoHomePage; CompanyInfo."Home Page")
                    { }
                    column(CompanyInfoFaxNo; CompanyInfo."Fax No.")
                    { }
                    column(CompanyInfoEmail; CompanyInfo."E-Mail")
                    { }
                    column(CompanyInfoSVATRegNo; CompanyInfo."SVAT Registration No.")
                    { }
                    column(CompanyInfoVATRegNo; CompanyInfo."VAT Registration No.")
                    { }
                    column(CompanyInfoGiroNo; CompanyInfo."Giro No.")
                    { }
                    column(CompanyInfoBankName; CompanyInfo."Bank Name")
                    { }
                    column(CompanyInfoBankAccNo; CompanyInfo."Bank Account No.")
                    { }
                    column(CompanyInfoPostCode; CompanyInfo.City)
                    { }
                    column(CompanyInfoswiftcode; CompanyInfo."SWIFT Code")
                    { }
                    column(CompanyInfoPicture; CompanyInfo.Picture)
                    { }
                    column(DocDate_PurchRcptHeader; FORMAT("Purch. Rcpt. Header"."Document Date", 0, 4))
                    { }
                    column(PurchaserText; PurchaserText)
                    { }
                    column(SalesPurchPersonName; SalesPurchPerson.Name)
                    { }
                    column(No1_PurchRcptHeader; "Purch. Rcpt. Header"."No.")
                    { }
                    column(PurchOrderNo; "Purch. Rcpt. Header"."Order No.")
                    { }
                    column(ReferenceText; ReferenceText)
                    { }
                    column(YourRef_PurchRcptHeader; "Purch. Rcpt. Header"."Your Reference")
                    { }
                    column(VendorShippmentNo; "Purch. Rcpt. Header"."Vendor Shipment No.")
                    { }
                    column(ShipToAddr7; ShipToAddr[7])
                    { }
                    column(ShipToAddr8; ShipToAddr[8])
                    { }
                    column(CompanyAddr5; CompanyAddr[5])
                    { }
                    column(CompanyAddr6; CompanyAddr[6])
                    { }
                    column(OutputNo; OutputNo)
                    { }
                    column(PhoneNoCaption; PhoneNoCaptionLbl)
                    { }
                    column(HomePageCaption; HomePageCaptionLbl)
                    { }
                    column(VATRegNoCaption; VATRegNoCaptionLbl)
                    { }
                    column(GiroNoCaption; GiroNoCaptionLbl)
                    { }
                    column(BankNameCaption; BankNameCaptionLbl)
                    { }
                    column(AccNoCaption; AccNoCaptionLbl)
                    { }
                    column(ShipmentNoCaption; ShipmentNoCaptionLbl)
                    { }
                    column(TaxAreaCode; "Purch. Rcpt. Header"."Tax Area Code")
                    { }
                    dataitem(DimensionLoop1; Integer)
                    {
                        DataItemLinkReference = "Purch. Rcpt. Header";
                        DataItemTableView = SORTING(Number) WHERE(Number = FILTER(1 ..));
                        column(DimText; DimText)
                        { }
                        column(HeaderDimCaption; HeaderDimCaptionLbl)
                        { }

                        trigger OnAfterGetRecord();
                        begin
                            IF Number = 1 THEN BEGIN
                                IF NOT DimSetEntry1.FINDSET THEN
                                    CurrReport.BREAK;
                            END ELSE
                                IF NOT Continue THEN
                                    CurrReport.BREAK;

                            CLEAR(DimText);
                            Continue := FALSE;
                            REPEAT
                                OldDimText := DimText;
                                IF DimText = '' THEN
                                    DimText := STRSUBSTNO('%1 - %2', DimSetEntry1."Dimension Code", DimSetEntry1."Dimension Value Code")
                                ELSE
                                    DimText :=
                                      STRSUBSTNO(
                                        '%1; %2 - %3', DimText,
                                        DimSetEntry1."Dimension Code", DimSetEntry1."Dimension Value Code");
                                IF STRLEN(DimText) > MAXSTRLEN(OldDimText) THEN BEGIN
                                    DimText := OldDimText;
                                    Continue := TRUE;
                                    EXIT;
                                END;
                            UNTIL DimSetEntry1.NEXT = 0;
                        end;

                        trigger OnPreDataItem();
                        begin
                            IF NOT ShowInternalInfo THEN
                                CurrReport.BREAK;
                        end;
                    }
                    dataitem("Purch. Rcpt. Line"; "Purch. Rcpt. Line")
                    {
                        DataItemLink = "Document No." = FIELD("No.");
                        DataItemLinkReference = "Purch. Rcpt. Header";
                        DataItemTableView = SORTING("Document No.", "Line No.");
                        column(ShowInternalInfo; ShowInternalInfo)
                        { }
                        column(Type_PurchRcptLine; FORMAT(Type, 0, 2))
                        { }
                        column(Desc_PurchRcptLine; Description)
                        {
                            IncludeCaption = false;
                        }
                        column(Qty_PurchRcptLine; Quantity)
                        {
                            IncludeCaption = false;
                        }
                        column(UOM_PurchRcptLine; "Unit of Measure")
                        {
                            IncludeCaption = false;
                        }
                        column(No_PurchRcptLine; "No.")
                        { }
                        column(DocNo_PurchRcptLine; "Document No.")
                        { }
                        column(LineNo_PurchRcptLine; "Line No.")
                        {
                            IncludeCaption = false;
                        }
                        column(No_PurchRcptLineCaption; FIELDCAPTION("No."))
                        { }
                        dataitem(DimensionLoop2; Integer)
                        {
                            DataItemTableView = SORTING(Number)
                                                WHERE(Number = FILTER(1 ..));
                            column(DimText1; DimText)
                            { }
                            column(LineDimCaption; LineDimCaptionLbl)
                            { }

                            trigger OnAfterGetRecord();
                            begin
                                IF Number = 1 THEN BEGIN
                                    IF NOT DimSetEntry2.FINDSET THEN
                                        CurrReport.BREAK;
                                END ELSE
                                    IF NOT Continue THEN
                                        CurrReport.BREAK;

                                CLEAR(DimText);
                                Continue := FALSE;
                                REPEAT
                                    OldDimText := DimText;
                                    IF DimText = '' THEN
                                        DimText := STRSUBSTNO('%1 - %2', DimSetEntry2."Dimension Code", DimSetEntry2."Dimension Value Code")
                                    ELSE
                                        DimText :=
                                          STRSUBSTNO(
                                            '%1; %2 - %3', DimText,
                                            DimSetEntry2."Dimension Code", DimSetEntry2."Dimension Value Code");
                                    IF STRLEN(DimText) > MAXSTRLEN(OldDimText) THEN BEGIN
                                        DimText := OldDimText;
                                        Continue := TRUE;
                                        EXIT;
                                    END;
                                UNTIL DimSetEntry2.NEXT = 0;
                            end;

                            trigger OnPreDataItem();
                            begin
                                IF NOT ShowInternalInfo THEN
                                    CurrReport.BREAK;
                            end;
                        }

                        trigger OnAfterGetRecord();
                        begin
                            IF (NOT ShowCorrectionLines) AND Correction THEN
                                CurrReport.SKIP;

                            DimSetEntry2.SETRANGE("Dimension Set ID", "Dimension Set ID");
                        end;

                        trigger OnPreDataItem();
                        begin
                            MoreLines := FIND('+');
                            WHILE MoreLines AND (Description = '') AND ("No." = '') AND (Quantity = 0) DO
                                MoreLines := NEXT(-1) <> 0;
                            IF NOT MoreLines THEN
                                CurrReport.BREAK;
                            SETRANGE("Line No.", 0, "Line No.");
                        end;
                    }
                    dataitem(Total; Integer)
                    {
                        DataItemTableView = SORTING(Number)
                                            WHERE(Number = CONST(1));
                        column(BuyfromVenNo_PurchRcptHeader; "Purch. Rcpt. Header"."Buy-from Vendor No.")
                        { }
                        column(BuyfromVenNo_PurchRcptHeaderCaption; "Purch. Rcpt. Header".FIELDCAPTION("Buy-from Vendor No."))
                        { }

                        trigger OnPreDataItem();
                        begin
                            IF "Purch. Rcpt. Header"."Buy-from Vendor No." = "Purch. Rcpt. Header"."Pay-to Vendor No." THEN
                                CurrReport.BREAK;
                        end;
                    }
                    dataitem(Total2; Integer)
                    {
                        DataItemTableView = SORTING(Number)
                                            WHERE(Number = CONST(1));
                        column(PaytoVenNo_PurchRcptHeader; "Purch. Rcpt. Header"."Pay-to Vendor No.")
                        { }
                        column(VendAddr1; VendAddr[1])
                        { }
                        column(VendAddr2; VendAddr[2])
                        { }
                        column(VendAddr3; VendAddr[3])
                        { }
                        column(VendAddr4; VendAddr[4])
                        { }
                        column(VendAddr5; VendAddr[5])
                        { }
                        column(VendAddr6; VendAddr[6])
                        { }
                        column(VendAddr7; VendAddr[7])
                        { }
                        column(VendAddr8; VendAddr[8])
                        { }
                        column(PaytoAddrCaption; PaytoAddrCaptionLbl)
                        { }
                        column(PaytoVenNo_PurchRcptHeaderCaption; "Purch. Rcpt. Header".FIELDCAPTION("Pay-to Vendor No."))
                        { }
                    }
                }

                trigger OnAfterGetRecord();
                begin
                    IF Number > 1 THEN BEGIN
                        CopyText := Text001;
                        OutputNo += 1;
                    END;
                    CurrReport.PAGENO := 1;
                end;

                trigger OnPostDataItem();
                begin
                    IF NOT CurrReport.PREVIEW THEN
                        RcptCountPrinted.RUN("Purch. Rcpt. Header");
                end;

                trigger OnPreDataItem();
                begin
                    OutputNo := 1;

                    NoOfLoops := ABS(NoOfCopies) + 1;
                    CopyText := '';
                    SETRANGE(Number, 1, NoOfLoops);
                end;
            }

            trigger OnAfterGetRecord();
            begin
                //CurrReport.LANGUAGE := Language.GetLanguageID("Language Code");   //MR

                CompanyInfo.GET;
                CompanyInfo.CALCFIELDS(Picture);

                IF RespCenter.GET("Responsibility Center") THEN BEGIN
                    FormatAddr.RespCenter(CompanyAddr, RespCenter);
                    CompanyInfo."Phone No." := RespCenter."Phone No.";
                    CompanyInfo."Fax No." := RespCenter."Fax No.";
                END ELSE
                    FormatAddr.Company(CompanyAddr, CompanyInfo);

                DimSetEntry1.SETRANGE("Dimension Set ID", "Dimension Set ID");

                IF "Purchaser Code" = '' THEN BEGIN
                    SalesPurchPerson.INIT;
                    PurchaserText := '';
                END ELSE BEGIN
                    SalesPurchPerson.GET("Purchaser Code");
                    PurchaserText := Text000
                END;
                IF "Your Reference" = '' THEN
                    ReferenceText := ''
                ELSE
                    ReferenceText := FIELDCAPTION("Your Reference");
                FormatAddr.PurchRcptShipTo(ShipToAddr, "Purch. Rcpt. Header");

                FormatAddr.PurchRcptPayTo(VendAddr, "Purch. Rcpt. Header");

                IF LogInteraction THEN
                    IF NOT CurrReport.PREVIEW THEN
                        SegManagement.LogDocument(
                          15, "No.", 0, 0, DATABASE::Vendor, "Buy-from Vendor No.", "Purchaser Code", '', "Posting Description", '');
            end;
        }
    }

    requestpage
    {
        SaveValues = true;

        layout
        {
            area(content)
            {
                group(Options)
                {
                    Caption = 'Options';
                    field(NoOfCopies; NoOfCopies)
                    {
                        ApplicationArea = All;
                        Caption = 'No. of Copies';
                    }
                    field(ShowInternalInfo; ShowInternalInfo)
                    {
                        ApplicationArea = All;
                        Caption = 'Show Internal Information';
                    }
                    field(LogInteraction; LogInteraction)
                    {
                        ApplicationArea = All;
                        Caption = 'Log Interaction';
                        Enabled = LogInteractionEnable;
                    }
                    field(ShowCorrectionLines; ShowCorrectionLines)
                    {
                        ApplicationArea = All;
                        Caption = 'Show Correction Lines';
                    }
                }
            }
        }

        actions
        {
        }

        trigger OnInit();
        begin
            LogInteractionEnable := TRUE;
        end;

        trigger OnOpenPage();
        begin
            LogInteraction := SegManagement.FindInteractTmplCode(15) <> '';
            LogInteractionEnable := LogInteraction;
        end;
    }

    labels
    {
    }

    var
        Text000: Label 'Purchaser';
        Text001: Label 'COPY';
        Text002: Label 'Purchase - Receipt %1';
        Text003: Label 'Page %1';
        CompanyInfo: Record "Company Information";
        SalesPurchPerson: Record "Salesperson/Purchaser";
        DimSetEntry1: Record "Dimension Set Entry";
        DimSetEntry2: Record "Dimension Set Entry";
        Language: Record Language;
        RespCenter: Record "Responsibility Center";
        RcptCountPrinted: Codeunit "Purch.Rcpt.-Printed";
        SegManagement: Codeunit "SegManagement";
        VendAddr: array[8] of Text[50];
        ShipToAddr: array[8] of Text[50];
        CompanyAddr: array[8] of Text[50];
        PurchaserText: Text[30];
        ReferenceText: Text[80];
        MoreLines: Boolean;
        NoOfCopies: Integer;
        NoOfLoops: Integer;
        CopyText: Text[30];
        FormatAddr: Codeunit "Format Address";
        DimText: Text[120];
        OldDimText: Text[75];
        ShowInternalInfo: Boolean;
        Continue: Boolean;
        LogInteraction: Boolean;
        ShowCorrectionLines: Boolean;
        OutputNo: Integer;
        [InDataSet]
        LogInteractionEnable: Boolean;
        PhoneNoCaptionLbl: Label 'Phone No.';
        HomePageCaptionLbl: Label 'Home Page';
        VATRegNoCaptionLbl: Label 'VAT Registration No.';
        GiroNoCaptionLbl: Label 'Giro No.';
        BankNameCaptionLbl: Label 'Bank';
        AccNoCaptionLbl: Label 'Account No.';
        ShipmentNoCaptionLbl: Label 'Shipment No.';
        HeaderDimCaptionLbl: Label 'Header Dimensions';
        LineDimCaptionLbl: Label 'Line Dimensions';
        PaytoAddrCaptionLbl: Label 'Pay-to Address';
        DocDateCaptionLbl: Label 'Document Date';
        PageCaptionLbl: Label 'Page';
        DescCaptionLbl: Label 'Description';
        QtyCaptionLbl: Label 'Quantity';
        UOMCaptionLbl: Label 'Unit Of Measure';
        PaytoVenNoCaptionLbl: Label 'Pay-to Vendor No.';
        EmailCaptionLbl: Label 'E-Mail';

    procedure InitializeRequest(NewNoOfCopies: Integer; NewShowInternalInfo: Boolean; NewLogInteraction: Boolean; NewShowCorrectionLines: Boolean);
    begin
        NoOfCopies := NewNoOfCopies;
        ShowInternalInfo := NewShowInternalInfo;
        LogInteraction := NewLogInteraction;
        ShowCorrectionLines := NewShowCorrectionLines;
    end;
}

