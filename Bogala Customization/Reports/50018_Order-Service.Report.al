report 50018 "Order - Service"
{
    //DefaultLayout = RDLC;
    RDLCLayout = './Reports/Order - Service.rdl';
    Caption = 'Order';

    dataset
    {
        dataitem("Purchase Header"; "Purchase Header")
        {
            DataItemTableView = SORTING("Document Type", "No.") WHERE("Document Type" = CONST(Order));
            RequestFilterFields = "No.", "Buy-from Vendor No.";
            //ReqFilterHeading = 'Purchase Order';
            column(CompanyInfoPicture; CompanyInfo.Picture)
            {
            }
            column(DocType_PurchHeader; "Document Type")
            {
            }
            column(No_PurchHeader; "No.")
            {
            }
            column(AmountCaption; AmountCaptionLbl)
            {
            }
            column(PurchLineInvDiscAmtCaption; PurchLineInvDiscAmtCaptionLbl)
            {
            }
            column(SubtotalCaption; SubtotalCaptionLbl)
            {
            }
            column(VATAmtLineVATCaption; VATAmtLineVATCaptionLbl)
            {
            }
            column(VATAmtLineVATAmtCaption; VATAmtLineVATAmtCaptionLbl)
            {
            }
            column(VATAmtSpecCaption; VATAmtSpecCaptionLbl)
            {
            }
            column(VATIdentifierCaption; VATIdentifierCaptionLbl)
            {
            }
            column(VATAmtLineInvDiscBaseAmtCaption; VATAmtLineInvDiscBaseAmtCaptionLbl)
            {
            }
            column(VATAmtLineLineAmtCaption; VATAmtLineLineAmtCaptionLbl)
            {
            }
            column(VALVATBaseLCYCaption; VALVATBaseLCYCaptionLbl)
            {
            }
            column(TotalCaption; TotalCaptionLbl)
            {
            }
            column(PaymentTermsDescCaption; PaymentTermsDescCaptionLbl)
            {
            }
            column(ShipmentMethodDescCaption; ShipmentMethodDescCaptionLbl)
            {
            }
            column(PrepymtTermsDescCaption; PrepymtTermsDescCaptionLbl)
            {
            }
            column(HomePageCaption; HomePageCaptionLbl)
            {
            }
            column(EmailIDCaption; EmailIDCaptionLbl)
            {
            }
            column(AllowInvoiceDiscCaption; AllowInvoiceDiscCaptionLbl)
            {
            }
            column(txtPurchaseComment; txtPurchaseComment)
            {
            }
            column(txtPurchaseCommentLine; txtPurchaseCommentLine)
            {
            }
            column(Status; "Purchase Header".Status)
            {
            }
            column(OrderDate; "Order Date")
            {
            }
            dataitem(CopyLoop; Integer)
            {
                DataItemTableView = SORTING(Number);
                dataitem(PageLoop; Integer)
                {
                    DataItemTableView = SORTING(Number)
                                        WHERE(Number = CONST(1));
                    column(ReportTitleCopyText; STRSUBSTNO(Text004, CopyText))
                    {
                    }
                    column(CurrRepPageNo; STRSUBSTNO(Text005, FORMAT(CurrReport.PAGENO)))
                    {
                    }
                    column(CompanyAddr1; CompanyAddr[1])
                    {
                    }
                    column(CompanyAddr2; CompanyAddr[2])
                    {
                    }
                    column(CompanyAddr3; CompanyAddr[3])
                    {
                    }
                    column(CompanyAddr4; CompanyAddr[4])
                    {
                    }
                    column(CompanyInfoPhoneNo; CompanyInfo."Phone No.")
                    {
                    }
                    column(CompanyInfoFaxNo; CompanyInfo."Fax No.")
                    {
                    }
                    column(CompanyInfoVATRegNo; CompanyInfo."VAT Registration No.")
                    {
                    }
                    column(CompanyInfoGiroNo; CompanyInfo."Giro No.")
                    {
                    }
                    column(CompanyInfoBankName; CompanyInfo."Bank Name")
                    {
                    }
                    column(CompanyInfoBankAccNo; CompanyInfo."Bank Account No.")
                    {
                    }
                    column(CompanyInfoSWIFTCode; CompanyInfo."SWIFT Code")
                    {
                    }
                    column(CompanyInfoSVATRegistrationNo; CompanyInfo."SVAT Registration No.")
                    {
                    }
                    column(CompanyInfoLocalSO_POPhoneNo; CompanyInfo."Local SO/PO Phone No")
                    {
                    }
                    column(DocDate_PurchHeader; FORMAT("Purchase Header"."Document Date", 0, 4))
                    {
                    }
                    column(VATNoText; VATNoText)
                    {
                    }
                    column(PurchaseHeaderPaymentTermsCode; "Purchase Header"."Payment Terms Code")
                    {
                    }
                    column(VATRegNo_PurchHeader; "Purchase Header"."VAT Registration No.")
                    {
                    }
                    column(PurchaserText; PurchaserText)
                    {
                    }
                    column(SalesPurchPersonName; SalesPurchPerson.Name)
                    {
                    }
                    column(ReferenceText; ReferenceText)
                    {
                    }
                    column(YourRef_PurchHeader; "Purchase Header"."Your Reference")
                    {
                    }
                    column(CompanyAddr5; CompanyAddr[5])
                    {
                    }
                    column(CompanyAddr6; CompanyAddr[6])
                    {
                    }
                    column(BuyFrmVendNo_PurchHeader; "Purchase Header"."Buy-from Vendor No.")
                    {
                    }
                    column(BuyFromAddr1; BuyFromAddr[1])
                    {
                    }
                    column(BuyFromAddr2; BuyFromAddr[2])
                    {
                    }
                    column(BuyFromAddr3; BuyFromAddr[3])
                    {
                    }
                    column(BuyFromAddr4; BuyFromAddr[4])
                    {
                    }
                    column(BuyFromAddr5; BuyFromAddr[5])
                    {
                    }
                    column(BuyFromAddr6; BuyFromAddr[6])
                    {
                    }
                    column(BuyFromAddr7; BuyFromAddr[7])
                    {
                    }
                    column(BuyFromAddr8; BuyFromAddr[8])
                    {
                    }
                    column(PricesInclVAT_PurchHeader; "Purchase Header"."Prices Including VAT")
                    {
                    }
                    column(OutputNo; OutputNo)
                    {
                    }
                    column(VATBaseDisc_PurchHeader; "Purchase Header"."VAT Base Discount %")
                    {
                    }
                    column(TaxAreaCode; "Purchase Header"."Tax Area Code")
                    {
                    }
                    column(PricesInclVATtxt; PricesInclVATtxt)
                    {
                    }
                    column(PaymentTermsDesc; PaymentTerms.Description)
                    {
                    }
                    column(ShipmentMethodDesc; ShipmentMethod.Description)
                    {
                    }
                    column(PrepmtPaymentTermsDesc; PrepmtPaymentTerms.Description)
                    {
                    }
                    column(ShowInternalInfo; ShowInternalInfo)
                    {
                    }
                    column(TotalText; TotalText)
                    {
                    }
                    column(DimText; DimText)
                    {
                    }
                    column(CompanyInfoPhoneNoCaption; CompanyInfoPhoneNoCaptionLbl)
                    {
                    }
                    column(CompanyInfoVATRegNoCaption; CompanyInfoVATRegNoCaptionLbl)
                    {
                    }
                    column(CompanyInfoGiroNoCaption; CompanyInfoGiroNoCaptionLbl)
                    {
                    }
                    column(CompanyInfoBankNameCaption; CompanyInfoBankNameCaptionLbl)
                    {
                    }
                    column(CompanyInfoBankAccNoCaption; CompanyInfoBankAccNoCaptionLbl)
                    {
                    }
                    column(OrderNoCaption; OrderNoCaptionLbl)
                    {
                    }
                    column(PageCaption; PageCaptionLbl)
                    {
                    }
                    column(DocumentDateCaption; DocumentDateCaptionLbl)
                    {
                    }
                    column(BuyFrmVendNo_PurchHeaderCaption; "Purchase Header".FIELDCAPTION("Buy-from Vendor No."))
                    {
                    }
                    column(PricesInclVAT_PurchHeaderCaption; "Purchase Header".FIELDCAPTION("Prices Including VAT"))
                    {
                    }
                    column(VendorInvoiceNo; "Purchase Header"."Vendor Invoice No.")
                    {
                    }
                    column(VendorInvoiceDate; "Purchase Header"."Vendor Invoice Date")
                    {
                    }
                    column(QuoteNo; "Purchase Header"."Quote No.")
                    {
                    }
                    column(ShiippingMarks; "Purchase Header"."Shiipping Marks")
                    {
                    }
                    column(PurchHdrCurrencyCode; "Purchase Header"."Currency Code")
                    {
                    }
                    dataitem(DimensionLoop1; Integer)
                    {
                        DataItemLinkReference = "Purchase Header";
                        DataItemTableView = SORTING(Number)
                                            WHERE(Number = FILTER(1 ..));
                        column(HdrDimCaption; HdrDimCaptionLbl)
                        {
                        }

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
                                    DimText := STRSUBSTNO('%1 %2', DimSetEntry1."Dimension Code", DimSetEntry1."Dimension Value Code")
                                ELSE
                                    DimText :=
                                      STRSUBSTNO(
                                        '%1, %2 %3', DimText,
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
                    dataitem("Purchase Line"; "Purchase Line")
                    {
                        DataItemLink = "Document Type" = FIELD("Document Type"), "Document No." = FIELD("No.");
                        DataItemLinkReference = "Purchase Header";
                        DataItemTableView = SORTING("Document Type", "Document No.", "Line No.");

                        trigger OnPreDataItem();
                        begin
                            CurrReport.BREAK;
                        end;
                    }
                    dataitem(RoundLoop; Integer)
                    {
                        DataItemTableView = SORTING(Number);
                        column(LineAmt_PurchLine; PurchLine."Line Amount")
                        {
                            AutoFormatExpression = "Purchase Line"."Currency Code";
                            AutoFormatType = 1;
                        }
                        column(LineNo_PurchLine; "Purchase Line"."Line No.")
                        {
                        }
                        column(AllowInvDisctxt; AllowInvDisctxt)
                        {
                        }
                        column(Type_PurchLine; FORMAT("Purchase Line".Type, 0, 2))
                        {
                        }
                        column(No_PurchLine; "Purchase Line"."No.")
                        {
                        }
                        column(Desc_PurchLine; "Purchase Line".Description)
                        {
                        }
                        column(Qty_PurchLine; "Purchase Line".Quantity)
                        {
                        }
                        column(UOM_PurchLine; "Purchase Line"."Unit of Measure")
                        {
                        }
                        column(DirUnitCost_PurchLine; "Purchase Line"."Direct Unit Cost")
                        {
                            AutoFormatExpression = "Purchase Header"."Currency Code";
                            AutoFormatType = 2;
                        }
                        column(LineDisc_PurchLine; "Purchase Line"."Line Discount %")
                        {
                        }
                        column(LineAmt2_PurchLine; PurchLine.Amount)
                        {
                            AutoFormatExpression = "Purchase Header"."Currency Code";
                            AutoFormatType = 1;
                        }
                        column(AllowInvDisc_PurchLine; "Purchase Line"."Allow Invoice Disc.")
                        {
                        }
                        column(HomePage; CompanyInfo."Home Page")
                        {
                        }
                        column(EMail; CompanyInfo."E-Mail")
                        {
                        }
                        column(VATIdentifier_PurchLine; "Purchase Line"."VAT Identifier")
                        {
                        }
                        column(InvDiscAmt_PurchLine; -PurchLine."Inv. Discount Amount")
                        {
                            AutoFormatExpression = "Purchase Line"."Currency Code";
                            AutoFormatType = 1;
                        }
                        column(TotalInclVAT; PurchLine."Line Amount" - PurchLine."Inv. Discount Amount")
                        {
                            AutoFormatExpression = "Purchase Header"."Currency Code";
                            AutoFormatType = 1;
                        }
                        column(TotalInclVATText; TotalInclVATText)
                        {
                        }
                        column(VATAmountText; VATAmountLine.VATAmountText)
                        {
                        }
                        column(VATAmount; VATAmount)
                        {
                            AutoFormatExpression = "Purchase Header"."Currency Code";
                            AutoFormatType = 1;
                        }
                        column(TotalExclVATText; TotalExclVATText)
                        {
                        }
                        column(VATDiscountAmount; -VATDiscountAmount)
                        {
                            AutoFormatExpression = "Purchase Header"."Currency Code";
                            AutoFormatType = 1;
                        }
                        column(VATBaseAmount; VATBaseAmount)
                        {
                            AutoFormatExpression = "Purchase Header"."Currency Code";
                            AutoFormatType = 1;
                        }
                        column(TotalAmountInclVAT; TotalAmountInclVAT)
                        {
                            AutoFormatExpression = "Purchase Header"."Currency Code";
                            AutoFormatType = 1;
                        }
                        column(TotalInvoiceDiscountAmount; TotalInvoiceDiscountAmount)
                        {
                            AutoFormatExpression = "Purchase Header"."Currency Code";
                            AutoFormatType = 1;
                        }
                        column(DirectUniCostCaption; DirectUniCostCaptionLbl)
                        {
                        }
                        column(PurchLineLineDiscCaption; PurchLineLineDiscCaptionLbl)
                        {
                        }
                        column(VATDiscountAmountCaption; VATDiscountAmountCaptionLbl)
                        {
                        }
                        column(No_PurchLineCaption; "Purchase Line".FIELDCAPTION("No."))
                        {
                        }
                        column(Desc_PurchLineCaption; "Purchase Line".FIELDCAPTION(Description))
                        {
                        }
                        column(Qty_PurchLineCaption; "Purchase Line".FIELDCAPTION(Quantity))
                        {
                        }
                        column(UOM_PurchLineCaption; "Purchase Line".FIELDCAPTION("Unit of Measure"))
                        {
                        }
                        column(VATIdentifier_PurchLineCaption; "Purchase Line".FIELDCAPTION("VAT Identifier"))
                        {
                        }
                        column(TotalSubTotal; TotalSubTotal)
                        {
                            AutoFormatExpression = "Purchase Header"."Currency Code";
                            AutoFormatType = 1;
                        }
                        column(TotalAmount; TotalAmount)
                        {
                            AutoFormatExpression = "Purchase Header"."Currency Code";
                            AutoFormatType = 1;
                        }
                        column(txtExtendedLine; txtExtendedLine)
                        {
                        }
                        column(TotNBTAmt; TotNBTAmt)
                        {
                        }
                        column(TotSVATAmt; TotSVATAmt)
                        {
                        }
                        column(TotVATAmt; TotVATAmt)
                        {
                        }
                        column(PurchLineDescription2; PurchLine."Description 2")
                        {
                        }
                        dataitem(DimensionLoop2; Integer)
                        {
                            DataItemTableView = SORTING(Number)
                                                WHERE(Number = FILTER(1 ..));
                            column(LineDimCaption; LineDimCaptionLbl)
                            {
                            }

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
                                        DimText := STRSUBSTNO('%1 %2', DimSetEntry2."Dimension Code", DimSetEntry2."Dimension Value Code")
                                    ELSE
                                        DimText :=
                                          STRSUBSTNO(
                                            '%1, %2 %3', DimText,
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

                                DimSetEntry2.SETRANGE("Dimension Set ID", "Purchase Line"."Dimension Set ID");
                            end;
                        }

                        trigger OnAfterGetRecord();
                        begin
                            icount := 0;
                            LineLevelTotal := 0.0;
                            TotNBTAmt := 0.0;
                            TotSVATAmt := 0.0;
                            TotVATAmt := 0.0;
                            TotalAmount := 0.0;
                            TotalSubTotal := 0;

                            IF Number = 1 THEN
                                PurchLine.FIND('-')
                            ELSE
                                PurchLine.NEXT;
                            "Purchase Line" := PurchLine;

                            //IF NOT "Purchase Header"."Prices Including VAT" AND
                            //   (PurchLine."VAT Calculation Type" = PurchLine."VAT Calculation Type"::"Full VAT")
                            //THEN
                            //  PurchLine."Line Amount" := 0;

                            IF (PurchLine.Type = PurchLine.Type::"G/L Account") AND (NOT ShowInternalInfo) THEN
                                "Purchase Line"."No." := '';
                            AllowInvDisctxt := FORMAT("Purchase Line"."Allow Invoice Disc.");
                            TotalSubTotal += PurchLine.Amount;
                            TotalInvoiceDiscountAmount -= "Purchase Line"."Inv. Discount Amount";
                            LineLevelTotal += PurchLine.Amount;

                            recTaxDetail.RESET;
                            recTaxDetail.SETRANGE(recTaxDetail."Tax Group Code", "Purchase Line"."Tax Group Code");
                            IF recTaxDetail.FIND('-') THEN BEGIN
                                REPEAT
                                    taxBelowAmt := recTaxDetail."Tax Below Maximum";
                                    IF recTaxDetail."Tax Jurisdiction Code" = 'NBT' THEN BEGIN
                                        LineLevelTotal += PurchLine.Amount * taxBelowAmt / 100;
                                        TotNBTAmt += PurchLine.Amount * taxBelowAmt / 100;
                                    END;

                                    IF (recTaxDetail."Tax Jurisdiction Code" = 'SVAT') AND ("Purchase Header"."Prices Including VAT" = TRUE) THEN BEGIN
                                        LineLevelTotal := 0.0;
                                        PurchLine.Amount := "Purchase Line"."Amount Including VAT";
                                        LineLevelTotal += ((PurchLine.Amount + TotNBTAmt) / (100 + taxBelowAmt)) * 100;
                                        //------DSA
                                        IF (recTaxDetail."Tax Group Code" = 'NBTSVAT|NBT2.04SVA') THEN
                                            TotSVATAmt += PurchLine.Amount - (((PurchLine.Amount) / (100 + taxBelowAmt)) * 100)
                                        ELSE
                                            TotSVATAmt += PurchLine.Amount - (((PurchLine.Amount + TotNBTAmt) / (100 + taxBelowAmt)) * 100);
                                        //TotSVATAmt+=PurchLine.Amount-(((PurchLine.Amount)/(100+taxBelowAmt))*100);
                                    END ELSE
                                        IF (recTaxDetail."Tax Jurisdiction Code" = 'SVAT') AND ("Purchase Header"."Prices Including VAT" = FALSE) THEN BEGIN
                                            IF (recTaxDetail."Tax Group Code" = 'NBTSVAT|NBT2.04SVA') THEN
                                                TotSVATAmt += (PurchLine.Amount + TotNBTAmt) * taxBelowAmt / 100
                                            ELSE
                                                TotSVATAmt += (PurchLine.Amount) * taxBelowAmt / 100;
                                            //TotSVATAmt+=(PurchLine.Amount)*taxBelowAmt/100;

                                        END;
                                    /*
                                    IF (recTaxDetail."Tax Group Code"='NBT2.04SVA') AND ("Purchase Header"."Prices Including VAT"=TRUE) THEN BEGIN
                                    LineLevelTotal:=0.0;
                                    PurchLine.Amount:="Purchase Line"."Amount Including VAT";
                                    LineLevelTotal+= ((PurchLine.Amount+TotNBTAmt)/(100+taxBelowAmt))*100;
                                    //TotSVATAmt+=PurchLine.Amount-(((PurchLine.Amount+TotNBTAmt)/(100+taxBelowAmt))*100);
                                    TotSVATAmt+=PurchLine.Amount-(((PurchLine.Amount)/(100+taxBelowAmt))*100);
                                    END ELSE IF (recTaxDetail."Tax Group Code"='NBT2.04SVA') AND ("Purchase Header"."Prices Including VAT"=FALSE) THEN BEGIN
                                    TotSVATAmt+=(PurchLine.Amount)*taxBelowAmt/100;
                                    //TotSVATAmt+=(PurchLine.Amount)*taxBelowAmt/100;

                                    END;
                                        */
                                    IF recTaxDetail."Tax Jurisdiction Code" = 'VAT' THEN BEGIN
                                        LineLevelTotal += (PurchLine.Amount + TotNBTAmt) * taxBelowAmt / 100;
                                        TotVATAmt += (PurchLine.Amount + TotNBTAmt) * taxBelowAmt / 100;
                                    END;
                                    icount += 1;
                                    recTaxDetail.NEXT;
                                UNTIL recTaxDetail.COUNT <= icount;
                            END;

                            TotalAmount += LineLevelTotal;

                            recExtendedTextLine.RESET;
                            recExtendedTextLine.SETRANGE(recExtendedTextLine."No.", "Purchase Line"."No.");
                            REPEAT
                                txtExtendedLine := recExtendedTextLine.Text;
                                icount1 += 1;
                                recExtendedTextLine.NEXT;
                            UNTIL recExtendedTextLine.COUNT <= icount1;

                        end;

                        trigger OnPostDataItem();
                        begin
                            PurchLine.DELETEALL;
                        end;

                        trigger OnPreDataItem();
                        begin
                            MoreLines := PurchLine.FIND('+');
                            WHILE MoreLines AND (PurchLine.Description = '') AND (PurchLine."Description 2" = '') AND
                                  (PurchLine."No." = '') AND (PurchLine.Quantity = 0) AND
                                  (PurchLine.Amount = 0)
                            DO
                                MoreLines := PurchLine.NEXT(-1) <> 0;
                            IF NOT MoreLines THEN
                                CurrReport.BREAK;
                            PurchLine.SETRANGE("Line No.", 0, PurchLine."Line No.");
                            SETRANGE(Number, 1, PurchLine.COUNT);
                            CurrReport.CREATETOTALS(PurchLine."Line Amount", PurchLine."Inv. Discount Amount");
                        end;
                    }
                    dataitem(VATCounter; Integer)
                    {
                        DataItemTableView = SORTING(Number);
                        column(VATAmtLineVATBase; VATAmountLine."VAT Base")
                        {
                            AutoFormatExpression = "Purchase Header"."Currency Code";
                            AutoFormatType = 1;
                        }
                        column(VATAmtLineVATAmt; VATAmountLine."VAT Amount")
                        {
                            AutoFormatExpression = "Purchase Header"."Currency Code";
                            AutoFormatType = 1;
                        }
                        column(VATAmtLineLineAmt; VATAmountLine."Line Amount")
                        {
                            AutoFormatExpression = "Purchase Header"."Currency Code";
                            AutoFormatType = 1;
                        }
                        column(VATAmtLineInvDiscBaseAmt; VATAmountLine."Inv. Disc. Base Amount")
                        {
                            AutoFormatExpression = "Purchase Header"."Currency Code";
                            AutoFormatType = 1;
                        }
                        column(VATAmtLineInvDiscAmt; VATAmountLine."Invoice Discount Amount")
                        {
                            AutoFormatExpression = "Purchase Header"."Currency Code";
                            AutoFormatType = 1;
                        }
                        column(VATAmtLineVAT; VATAmountLine."VAT %")
                        {
                            DecimalPlaces = 0 : 5;
                        }
                        column(VATAmtLineVATIdentifier; VATAmountLine."VAT Identifier")
                        {
                        }

                        trigger OnAfterGetRecord();
                        begin
                            VATAmountLine.GetLine(Number);
                        end;

                        trigger OnPreDataItem();
                        begin
                            IF VATAmount = 0 THEN
                                CurrReport.BREAK;
                            SETRANGE(Number, 1, VATAmountLine.COUNT);
                            CurrReport.CREATETOTALS(
                              VATAmountLine."Line Amount", VATAmountLine."Inv. Disc. Base Amount",
                              VATAmountLine."Invoice Discount Amount", VATAmountLine."VAT Base", VATAmountLine."VAT Amount");
                        end;
                    }
                    dataitem(VATCounterLCY; Integer)
                    {
                        DataItemTableView = SORTING(Number);
                        column(VALExchRate; VALExchRate)
                        {
                        }
                        column(VALSpecLCYHeader; VALSpecLCYHeader)
                        {
                        }
                        column(VALVATAmountLCY; VALVATAmountLCY)
                        {
                            AutoFormatType = 1;
                        }
                        column(VALVATBaseLCY; VALVATBaseLCY)
                        {
                            AutoFormatType = 1;
                        }

                        trigger OnAfterGetRecord();
                        begin
                            VATAmountLine.GetLine(Number);

                            VALVATBaseLCY := ROUND(CurrExchRate.ExchangeAmtFCYToLCY(
                                  "Purchase Header"."Posting Date", "Purchase Header"."Currency Code",
                                  VATAmountLine."VAT Base", "Purchase Header"."Currency Factor"));
                            VALVATAmountLCY := ROUND(CurrExchRate.ExchangeAmtFCYToLCY(
                                  "Purchase Header"."Posting Date", "Purchase Header"."Currency Code",
                                  VATAmountLine."VAT Amount", "Purchase Header"."Currency Factor"));
                        end;

                        trigger OnPreDataItem();
                        begin
                            IF (NOT GLSetup."Print VAT specification in LCY") OR
                               ("Purchase Header"."Currency Code" = '') OR
                               (VATAmountLine.GetTotalVATAmount = 0)
                            THEN
                                CurrReport.BREAK;

                            SETRANGE(Number, 1, VATAmountLine.COUNT);
                            CurrReport.CREATETOTALS(VALVATBaseLCY, VALVATAmountLCY);

                            IF GLSetup."LCY Code" = '' THEN
                                VALSpecLCYHeader := Text007 + Text008
                            ELSE
                                VALSpecLCYHeader := Text007 + FORMAT(GLSetup."LCY Code");

                            CurrExchRate.FindCurrency("Purchase Header"."Posting Date", "Purchase Header"."Currency Code", 1);
                            VALExchRate := STRSUBSTNO(Text009, CurrExchRate."Relational Exch. Rate Amount", CurrExchRate."Exchange Rate Amount");
                        end;
                    }
                    dataitem(Total2; Integer)
                    {
                        DataItemTableView = SORTING(Number)
                                            WHERE(Number = CONST(1));
                        column(PayToVendNo_PurchHeader; "Purchase Header"."Pay-to Vendor No.")
                        {
                        }
                        column(VendAddr8; VendAddr[8])
                        {
                        }
                        column(VendAddr7; VendAddr[7])
                        {
                        }
                        column(VendAddr6; VendAddr[6])
                        {
                        }
                        column(VendAddr5; VendAddr[5])
                        {
                        }
                        column(VendAddr4; VendAddr[4])
                        {
                        }
                        column(VendAddr3; VendAddr[3])
                        {
                        }
                        column(VendAddr2; VendAddr[2])
                        {
                        }
                        column(VendAddr1; VendAddr[1])
                        {
                        }
                        column(PaymentDetailsCaption; PaymentDetailsCaptionLbl)
                        {
                        }
                        column(VendNoCaption; VendNoCaptionLbl)
                        {
                        }

                        trigger OnPreDataItem();
                        begin
                            IF "Purchase Header"."Buy-from Vendor No." = "Purchase Header"."Pay-to Vendor No." THEN
                                CurrReport.BREAK;
                        end;
                    }
                    dataitem(Total3; Integer)
                    {
                        DataItemTableView = SORTING(Number)
                                            WHERE(Number = CONST(1));
                        column(SellToCustNo_PurchHeader; "Purchase Header"."Sell-to Customer No.")
                        {
                        }
                        column(ShipToAddr1; ShipToAddr[1])
                        {
                        }
                        column(ShipToAddr2; ShipToAddr[2])
                        {
                        }
                        column(ShipToAddr3; ShipToAddr[3])
                        {
                        }
                        column(ShipToAddr4; ShipToAddr[4])
                        {
                        }
                        column(ShipToAddr5; ShipToAddr[5])
                        {
                        }
                        column(ShipToAddr6; ShipToAddr[6])
                        {
                        }
                        column(ShipToAddr7; ShipToAddr[7])
                        {
                        }
                        column(ShipToAddr8; ShipToAddr[8])
                        {
                        }
                        column(ShiptoAddressCaption; ShiptoAddressCaptionLbl)
                        {
                        }
                        column(SellToCustNo_PurchHeaderCaption; "Purchase Header".FIELDCAPTION("Sell-to Customer No."))
                        {
                        }

                        trigger OnPreDataItem();
                        begin
                            IF ("Purchase Header"."Sell-to Customer No." = '') AND (ShipToAddr[1] = '') THEN
                                CurrReport.BREAK;
                        end;
                    }
                    dataitem(PrepmtLoop; Integer)
                    {
                        DataItemTableView = SORTING(Number)
                                            WHERE(Number = FILTER(1 ..));
                        column(PrepmtLineAmount; PrepmtLineAmount)
                        {
                            AutoFormatExpression = "Purchase Header"."Currency Code";
                            AutoFormatType = 1;
                        }
                        column(PrepmtInvBufGLAccNo; PrepmtInvBuf."G/L Account No.")
                        {
                        }
                        column(PrepmtInvBufDesc; PrepmtInvBuf.Description)
                        {
                        }
                        column(TotalInclVATText2; TotalInclVATText)
                        {
                        }
                        column(TotalExclVATText2; TotalExclVATText)
                        {
                        }
                        column(PrepmtInvBufAmt; PrepmtInvBuf.Amount)
                        {
                            AutoFormatExpression = "Purchase Header"."Currency Code";
                            AutoFormatType = 1;
                        }
                        column(PrepmtVATAmountText; PrepmtVATAmountLine.VATAmountText)
                        {
                        }
                        column(PrepmtVATAmount; PrepmtVATAmount)
                        {
                            AutoFormatExpression = "Purchase Header"."Currency Code";
                            AutoFormatType = 1;
                        }
                        column(PrepmtTotalAmountInclVAT; PrepmtTotalAmountInclVAT)
                        {
                            AutoFormatExpression = "Purchase Header"."Currency Code";
                            AutoFormatType = 1;
                        }
                        column(PrepmtVATBaseAmount; PrepmtVATBaseAmount)
                        {
                            AutoFormatExpression = "Purchase Header"."Currency Code";
                            AutoFormatType = 1;
                        }
                        column(PrepmtInvBuDescCaption; PrepmtInvBuDescCaptionLbl)
                        {
                        }
                        column(PrepmtInvBufGLAccNoCaption; PrepmtInvBufGLAccNoCaptionLbl)
                        {
                        }
                        column(PrepaymentSpecCaption; PrepaymentSpecCaptionLbl)
                        {
                        }
                        dataitem(PrepmtDimLoop; Integer)
                        {
                            DataItemTableView = SORTING(Number)
                                                WHERE(Number = FILTER(1 ..));

                            trigger OnAfterGetRecord();
                            begin
                                IF Number = 1 THEN BEGIN
                                    IF NOT PrepmtDimSetEntry.FINDSET THEN
                                        CurrReport.BREAK;
                                END ELSE
                                    IF NOT Continue THEN
                                        CurrReport.BREAK;

                                CLEAR(DimText);
                                Continue := FALSE;
                                REPEAT
                                    OldDimText := DimText;
                                    IF DimText = '' THEN
                                        DimText := STRSUBSTNO('%1 %2', PrepmtDimSetEntry."Dimension Code", PrepmtDimSetEntry."Dimension Value Code")
                                    ELSE
                                        DimText :=
                                          STRSUBSTNO(
                                            '%1, %2 %3', DimText,
                                            PrepmtDimSetEntry."Dimension Code", PrepmtDimSetEntry."Dimension Value Code");
                                    IF STRLEN(DimText) > MAXSTRLEN(OldDimText) THEN BEGIN
                                        DimText := OldDimText;
                                        Continue := TRUE;
                                        EXIT;
                                    END;
                                UNTIL PrepmtDimSetEntry.NEXT = 0;
                            end;
                        }

                        trigger OnAfterGetRecord();
                        begin
                            IF Number = 1 THEN BEGIN
                                IF NOT PrepmtInvBuf.FIND('-') THEN
                                    CurrReport.BREAK;
                            END ELSE
                                IF PrepmtInvBuf.NEXT = 0 THEN
                                    CurrReport.BREAK;

                            IF ShowInternalInfo THEN
                                PrepmtDimSetEntry.SETRANGE("Dimension Set ID", PrepmtInvBuf."Dimension Set ID");

                            IF "Purchase Header"."Prices Including VAT" THEN
                                PrepmtLineAmount := PrepmtInvBuf."Amount Incl. VAT"
                            ELSE
                                PrepmtLineAmount := PrepmtInvBuf.Amount;
                        end;

                        trigger OnPreDataItem();
                        begin
                            CurrReport.CREATETOTALS(
                              PrepmtInvBuf.Amount, PrepmtInvBuf."Amount Incl. VAT",
                              PrepmtVATAmountLine."Line Amount", PrepmtVATAmountLine."VAT Base",
                              PrepmtVATAmountLine."VAT Amount",
                              PrepmtLineAmount);
                        end;
                    }
                    dataitem(PrepmtVATCounter; Integer)
                    {
                        DataItemTableView = SORTING(Number);
                        column(PrepmtVATAmtLineVATAmt; PrepmtVATAmountLine."VAT Amount")
                        {
                            AutoFormatExpression = "Purchase Header"."Currency Code";
                            AutoFormatType = 1;
                        }
                        column(PrepmtVATAmtLineVATBase; PrepmtVATAmountLine."VAT Base")
                        {
                            AutoFormatExpression = "Purchase Header"."Currency Code";
                            AutoFormatType = 1;
                        }
                        column(PrepmtVATAmtLineLineAmt; PrepmtVATAmountLine."Line Amount")
                        {
                            AutoFormatExpression = "Purchase Header"."Currency Code";
                            AutoFormatType = 1;
                        }
                        column(PrepmtVATAmtLineVAT; PrepmtVATAmountLine."VAT %")
                        {
                            DecimalPlaces = 0 : 5;
                        }
                        column(PrepmtVATAmtLineVATId; PrepmtVATAmountLine."VAT Identifier")
                        {
                        }
                        column(PrepymtVATAmtSpecCaption; PrepymtVATAmtSpecCaptionLbl)
                        {
                        }

                        trigger OnAfterGetRecord();
                        begin
                            PrepmtVATAmountLine.GetLine(Number);
                        end;

                        trigger OnPreDataItem();
                        begin
                            SETRANGE(Number, 1, PrepmtVATAmountLine.COUNT);
                        end;
                    }
                }

                trigger OnAfterGetRecord();
                var
                    PrepmtPurchLine: Record "Purchase Line" temporary;
                    TempPurchLine: Record "Purchase Line" temporary;
                begin
                    CLEAR(PurchLine);
                    CLEAR(PurchPost);
                    PurchLine.DELETEALL;
                    VATAmountLine.DELETEALL;
                    PurchPost.GetPurchLines("Purchase Header", PurchLine, 0);
                    PurchLine.CalcVATAmountLines(0, "Purchase Header", PurchLine, VATAmountLine);
                    PurchLine.UpdateVATOnLines(0, "Purchase Header", PurchLine, VATAmountLine);
                    VATAmount := VATAmountLine.GetTotalVATAmount;
                    VATBaseAmount := VATAmountLine.GetTotalVATBase;
                    VATDiscountAmount :=
                      VATAmountLine.GetTotalVATDiscount("Purchase Header"."Currency Code", "Purchase Header"."Prices Including VAT");
                    TotalAmountInclVAT := VATAmountLine.GetTotalAmountInclVAT;

                    PrepmtInvBuf.DELETEALL;
                    PurchPostPrepmt.GetPurchLines("Purchase Header", 0, PrepmtPurchLine);
                    IF NOT PrepmtPurchLine.ISEMPTY THEN BEGIN
                        PurchPostPrepmt.GetPurchLinesToDeduct("Purchase Header", TempPurchLine);
                        IF NOT TempPurchLine.ISEMPTY THEN
                            PurchPostPrepmt.CalcVATAmountLines("Purchase Header", TempPurchLine, PrePmtVATAmountLineDeduct, 1);
                    END;
                    PurchPostPrepmt.CalcVATAmountLines("Purchase Header", PrepmtPurchLine, PrepmtVATAmountLine, 0);
                    IF PrepmtVATAmountLine.FINDSET THEN
                        REPEAT
                            PrePmtVATAmountLineDeduct := PrepmtVATAmountLine;
                            IF PrePmtVATAmountLineDeduct.FIND THEN BEGIN
                                PrepmtVATAmountLine."VAT Base" := PrepmtVATAmountLine."VAT Base" - PrePmtVATAmountLineDeduct."VAT Base";
                                PrepmtVATAmountLine."VAT Amount" := PrepmtVATAmountLine."VAT Amount" - PrePmtVATAmountLineDeduct."VAT Amount";
                                PrepmtVATAmountLine."Amount Including VAT" := PrepmtVATAmountLine."Amount Including VAT" -
                                  PrePmtVATAmountLineDeduct."Amount Including VAT";
                                PrepmtVATAmountLine."Line Amount" := PrepmtVATAmountLine."Line Amount" - PrePmtVATAmountLineDeduct."Line Amount";
                                PrepmtVATAmountLine."Inv. Disc. Base Amount" := PrepmtVATAmountLine."Inv. Disc. Base Amount" -
                                  PrePmtVATAmountLineDeduct."Inv. Disc. Base Amount";
                                PrepmtVATAmountLine."Invoice Discount Amount" := PrepmtVATAmountLine."Invoice Discount Amount" -
                                  PrePmtVATAmountLineDeduct."Invoice Discount Amount";
                                PrepmtVATAmountLine."Calculated VAT Amount" := PrepmtVATAmountLine."Calculated VAT Amount" -
                                  PrePmtVATAmountLineDeduct."Calculated VAT Amount";
                                PrepmtVATAmountLine.MODIFY;
                            END;
                        UNTIL PrepmtVATAmountLine.NEXT = 0;
                    PurchPostPrepmt.UpdateVATOnLines("Purchase Header", PrepmtPurchLine, PrepmtVATAmountLine, 0);
                    //PurchPostPrepmt.BuildInvLineBuffer2("Purchase Header", PrepmtPurchLine, 0, PrepmtInvBuf);   //MR
                    PrepmtVATAmount := PrepmtVATAmountLine.GetTotalVATAmount;
                    PrepmtVATBaseAmount := PrepmtVATAmountLine.GetTotalVATBase;
                    PrepmtTotalAmountInclVAT := PrepmtVATAmountLine.GetTotalAmountInclVAT;

                    IF Number > 1 THEN
                        CopyText := Text003;
                    CurrReport.PAGENO := 1;
                    OutputNo := OutputNo + 1;
                end;

                trigger OnPostDataItem();
                begin
                    IF NOT CurrReport.PREVIEW THEN
                        PurchCountPrinted.RUN("Purchase Header");
                end;

                trigger OnPreDataItem();
                begin
                    NoOfLoops := ABS(NoOfCopies) + 1;
                    CopyText := '';
                    SETRANGE(Number, 1, NoOfLoops);
                    OutputNo := 0;
                end;
            }

            trigger OnAfterGetRecord();
            begin
                //CurrReport.LANGUAGE := Language.GetLanguageID("Language Code");   //MR

                icount2 := 0;
                icount3 := 0;
                txtPurchaseComment := '';
                txtPurchaseCommentLine := '';

                //TotNBTAmt:=0.0;
                //TotSVATAmt:=0.0;
                //TotVATAmt:=0.0;
                //TotalAmount:=0.0;
                //TotalSubTotal := 0;

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
                IF "VAT Registration No." = '' THEN
                    VATNoText := ''
                ELSE
                    VATNoText := FIELDCAPTION("VAT Registration No.");
                IF "Currency Code" = '' THEN BEGIN
                    GLSetup.TESTFIELD("LCY Code");
                    TotalText := STRSUBSTNO(Text001, GLSetup."LCY Code");
                    TotalInclVATText := STRSUBSTNO(Text002, GLSetup."LCY Code");
                    TotalExclVATText := STRSUBSTNO(Text006, GLSetup."LCY Code");
                END ELSE BEGIN
                    TotalText := STRSUBSTNO(Text001, "Currency Code");
                    TotalInclVATText := STRSUBSTNO(Text002, "Currency Code");
                    TotalExclVATText := STRSUBSTNO(Text006, "Currency Code");
                END;

                FormatAddr.PurchHeaderBuyFrom(BuyFromAddr, "Purchase Header");
                IF "Buy-from Vendor No." <> "Pay-to Vendor No." THEN
                    FormatAddr.PurchHeaderPayTo(VendAddr, "Purchase Header");
                IF "Payment Terms Code" = '' THEN
                    PaymentTerms.INIT
                ELSE BEGIN
                    PaymentTerms.GET("Payment Terms Code");
                    PaymentTerms.TranslateDescription(PaymentTerms, "Language Code");
                END;
                IF "Prepmt. Payment Terms Code" = '' THEN
                    PrepmtPaymentTerms.INIT
                ELSE BEGIN
                    PrepmtPaymentTerms.GET("Prepmt. Payment Terms Code");
                    PrepmtPaymentTerms.TranslateDescription(PrepmtPaymentTerms, "Language Code");
                END;
                IF "Shipment Method Code" = '' THEN
                    ShipmentMethod.INIT
                ELSE BEGIN
                    ShipmentMethod.GET("Shipment Method Code");
                    ShipmentMethod.TranslateDescription(ShipmentMethod, "Language Code");
                END;

                FormatAddr.PurchHeaderShipTo(ShipToAddr, "Purchase Header");

                IF NOT CurrReport.PREVIEW THEN BEGIN
                    IF ArchiveDocument THEN
                        ArchiveManagement.StorePurchDocument("Purchase Header", LogInteraction);

                    IF LogInteraction THEN BEGIN
                        CALCFIELDS("No. of Archived Versions");
                        SegManagement.LogDocument(
                          13, "No.", "Doc. No. Occurrence", "No. of Archived Versions", DATABASE::Vendor, "Buy-from Vendor No.",
                          "Purchaser Code", '', "Posting Description", '');
                    END;
                END;
                PricesInclVATtxt := FORMAT("Prices Including VAT");

                recPurchaseCommentLine.RESET;
                recPurchaseCommentLine.SETRANGE(recPurchaseCommentLine."No.", "Purchase Header"."No.");
                REPEAT
                    IF (recPurchaseCommentLine.Comment <> '') AND (recPurchaseCommentLine."Document Line No." = 0) THEN BEGIN
                        txtPurchaseComment += recPurchaseCommentLine.Comment + ' ';
                    END ELSE
                        IF (recPurchaseCommentLine.Comment <> '') AND (recPurchaseCommentLine."Document Line No." > 0) THEN BEGIN
                            txtPurchaseCommentLine += recPurchaseCommentLine.Comment + ' ';
                        END;
                    icount2 += 1;
                    recPurchaseCommentLine.NEXT;
                UNTIL recPurchaseCommentLine.COUNT < icount2;
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
                    field(NoofCopies; NoOfCopies)
                    {
                        ApplicationArea = All;
                        Caption = 'No. of Copies';
                    }
                    field(ShowInternalInformation; ShowInternalInfo)
                    {
                        ApplicationArea = All;
                        Caption = 'Show Internal Information';
                    }
                    field(ArchiveDocument; ArchiveDocument)
                    {
                        ApplicationArea = All;
                        Caption = 'Archive Document';

                        trigger OnValidate();
                        begin
                            IF NOT ArchiveDocument THEN
                                LogInteraction := FALSE;
                        end;
                    }
                    field(LogInteraction; LogInteraction)
                    {
                        ApplicationArea = All;
                        Caption = 'Log Interaction';
                        Enabled = LogInteractionEnable;

                        trigger OnValidate();
                        begin
                            IF LogInteraction THEN
                                ArchiveDocument := ArchiveDocumentEnable;
                        end;
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
            //ArchiveDocument := PurchSetup."Archive Quotes and Orders";    //MR
            LogInteraction := SegManagement.FindInteractTmplCode(13) <> '';

            LogInteractionEnable := LogInteraction;
        end;
    }

    labels
    {
    }

    trigger OnInitReport();
    begin
        GLSetup.GET;
        PurchSetup.GET;
    end;

    trigger OnPreReport();
    begin
        CompanyInfo.GET;
        CompanyInfo.CALCFIELDS(Picture);
    end;

    var
        Text000: Label 'Purchaser';
        Text001: Label 'Total %1';
        Text002: Label 'Total %1 Incl. VAT';
        Text003: Label '" COPY"';
        Text004: Label 'Order%1';
        Text005: Label 'Page %1';
        Text006: Label 'Total %1 Excl. VAT';
        GLSetup: Record "General Ledger Setup";
        CompanyInfo: Record "Company Information";
        ShipmentMethod: Record "Shipment Method";
        PaymentTerms: Record "Payment Terms";
        PrepmtPaymentTerms: Record "Payment Terms";
        SalesPurchPerson: Record "Salesperson/Purchaser";
        VATAmountLine: Record "VAT Amount Line" temporary;
        PrepmtVATAmountLine: Record "VAT Amount Line" temporary;
        PrePmtVATAmountLineDeduct: Record "VAT Amount Line" temporary;
        PurchLine: Record "Purchase Line" temporary;
        DimSetEntry1: Record "Dimension Set Entry";
        DimSetEntry2: Record "Dimension Set Entry";
        PrepmtDimSetEntry: Record "Dimension Set Entry";
        PrepmtInvBuf: Record "Prepayment Inv. Line Buffer" temporary;
        RespCenter: Record "Responsibility Center";
        Language: Record "Language";
        CurrExchRate: Record "Currency Exchange Rate";
        PurchSetup: Record "Purchases & Payables Setup";
        PurchCountPrinted: Codeunit "Purch.Header-Printed";
        FormatAddr: Codeunit "Format Address";
        PurchPost: Codeunit "Purch.-Post";
        ArchiveManagement: Codeunit "ArchiveManagement";
        SegManagement: Codeunit "SegManagement";
        PurchPostPrepmt: Codeunit "Purchase-Post Prepayments";
        VendAddr: array[8] of Text[50];
        ShipToAddr: array[8] of Text[50];
        CompanyAddr: array[8] of Text[50];
        BuyFromAddr: array[8] of Text[50];
        PurchaserText: Text[30];
        VATNoText: Text[80];
        ReferenceText: Text[80];
        TotalText: Text[50];
        TotalInclVATText: Text[50];
        TotalExclVATText: Text[50];
        MoreLines: Boolean;
        NoOfCopies: Integer;
        NoOfLoops: Integer;
        CopyText: Text[30];
        OutputNo: Integer;
        DimText: Text[120];
        OldDimText: Text[75];
        ShowInternalInfo: Boolean;
        Continue: Boolean;
        ArchiveDocument: Boolean;
        LogInteraction: Boolean;
        VATAmount: Decimal;
        VATBaseAmount: Decimal;
        VATDiscountAmount: Decimal;
        TotalAmountInclVAT: Decimal;
        VALVATBaseLCY: Decimal;
        VALVATAmountLCY: Decimal;
        VALSpecLCYHeader: Text[80];
        VALExchRate: Text[50];
        Text007: Label '"VAT Amount Specification in "';
        Text008: Label 'Local Currency';
        Text009: Label 'Exchange rate: %1/%2';
        PrepmtVATAmount: Decimal;
        PrepmtVATBaseAmount: Decimal;
        PrepmtTotalAmountInclVAT: Decimal;
        PrepmtLineAmount: Decimal;
        PricesInclVATtxt: Text[30];
        AllowInvDisctxt: Text[30];
        [InDataSet]
        ArchiveDocumentEnable: Boolean;
        [InDataSet]
        LogInteractionEnable: Boolean;
        TotalSubTotal: Decimal;
        TotalAmount: Decimal;
        TotalInvoiceDiscountAmount: Decimal;
        CompanyInfoPhoneNoCaptionLbl: Label 'Phone No.';
        CompanyInfoVATRegNoCaptionLbl: Label 'VAT Registration No.';
        CompanyInfoGiroNoCaptionLbl: Label 'Giro No.';
        CompanyInfoBankNameCaptionLbl: Label 'Bank';
        CompanyInfoBankAccNoCaptionLbl: Label 'Account No.';
        OrderNoCaptionLbl: Label 'Order No.';
        PageCaptionLbl: Label 'Page';
        DocumentDateCaptionLbl: Label 'Document Date';
        HdrDimCaptionLbl: Label 'Header Dimensions';
        DirectUniCostCaptionLbl: Label 'Direct Unit Cost';
        PurchLineLineDiscCaptionLbl: Label 'Discount %';
        VATDiscountAmountCaptionLbl: Label 'Payment Discount on VAT';
        LineDimCaptionLbl: Label 'Line Dimensions';
        PaymentDetailsCaptionLbl: Label 'Payment Details';
        VendNoCaptionLbl: Label 'Vendor No.';
        ShiptoAddressCaptionLbl: Label 'Ship-to Address';
        PrepmtInvBuDescCaptionLbl: Label 'Description';
        PrepmtInvBufGLAccNoCaptionLbl: Label 'G/L Account No.';
        PrepaymentSpecCaptionLbl: Label 'Prepayment Specification';
        PrepymtVATAmtSpecCaptionLbl: Label 'Prepayment VAT Amount Specification';
        AmountCaptionLbl: Label 'Amount';
        PurchLineInvDiscAmtCaptionLbl: Label 'Invoice Discount Amount';
        SubtotalCaptionLbl: Label 'Subtotal';
        VATAmtLineVATCaptionLbl: Label 'VAT %';
        VATAmtLineVATAmtCaptionLbl: Label 'VAT Amount';
        VATAmtSpecCaptionLbl: Label 'VAT Amount Specification';
        VATIdentifierCaptionLbl: Label 'VAT Identifier';
        VATAmtLineInvDiscBaseAmtCaptionLbl: Label 'Invoice Discount Base Amount';
        VATAmtLineLineAmtCaptionLbl: Label 'Line Amount';
        VALVATBaseLCYCaptionLbl: Label 'VAT Base';
        TotalCaptionLbl: Label 'Total';
        PaymentTermsDescCaptionLbl: Label 'Payment Terms';
        ShipmentMethodDescCaptionLbl: Label 'Shipment Method';
        PrepymtTermsDescCaptionLbl: Label 'Prepmt. Payment Terms';
        HomePageCaptionLbl: Label 'Home Page';
        EmailIDCaptionLbl: Label 'E-Mail';
        AllowInvoiceDiscCaptionLbl: Label 'Allow Invoice Discount';
        recExtendedTextLine: Record "Extended Text Line";
        recPurchaseCommentLine: Record "Purch. Comment Line";
        txtExtendedLine: Text[300];
        txtPurchaseComment: Text[300];
        TotNBTAmt: Decimal;
        TotSVATAmt: Decimal;
        TotVATAmt: Decimal;
        recTaxAreaLine: Record "Tax Area Line";
        recTaxDetail: Record "Tax Detail";
        taxBelowAmt: Decimal;
        LineLevelTotal: Decimal;
        icount: Integer;
        icount1: Integer;
        txtPurchaseCommentLine: Text[300];
        txtDescriptionLine: Text[300];
        icount2: Integer;
        icount3: Integer;
        recPurchaseCommentLine1: Record "Purch. Comment Line";

    procedure InitializeRequest(NewNoOfCopies: Integer; NewShowInternalInfo: Boolean; NewArchiveDocument: Boolean; NewLogInteraction: Boolean);
    begin
        NoOfCopies := NewNoOfCopies;
        ShowInternalInfo := NewShowInternalInfo;
        ArchiveDocument := NewArchiveDocument;
        LogInteraction := NewLogInteraction;
    end;
}

