codeunit 50002 "Customization Management"
{
    EventSubscriberInstance = StaticAutomatic;
    //Get data to Gen. Journl Line to G/L Entry
    [EventSubscriber(ObjectType::Table, 17, 'OnAfterCopyGLEntryFromGenJnlLine', '', true, true)]
    local procedure CopyGLEntryFromGenJnlLine(var GLEntry: Record "G/L Entry"; var GenJournalLine: Record "Gen. Journal Line")
    begin
        GLEntry."Description 2" := GenJournalLine."Description 2";
        GLEntry."REM_TYPE" := GenJournalLine."REM_TYPE";
        GLEntry."CHG_FROM" := GenJournalLine."CHG_FROM";
    end;

    //Get data to Gen. Journl Line to Customer Ledger Entry
    [EventSubscriber(ObjectType::Table, 21, 'OnAfterCopyCustLedgerEntryFromGenJnlLine', '', true, true)]
    local procedure CopyCustLedgerEntryFromGenJnlLine(var CustLedgerEntry: Record "Cust. Ledger Entry"; GenJournalLine: Record "Gen. Journal Line")
    begin
        CustLedgerEntry."Description 2" := GenJournalLine."Description 2";
    end;

    //Get data to Gen. Journl Line to Vendor Ledger Entry
    [EventSubscriber(ObjectType::Table, 25, 'OnAfterCopyVendLedgerEntryFromGenJnlLine', '', true, true)]
    local procedure CopyVendLedgerEntryFromGenJnlLine(var VendorLedgerEntry: Record "Vendor Ledger Entry"; GenJournalLine: Record "Gen. Journal Line")
    begin
        VendorLedgerEntry."Description 2" := GenJournalLine."Description 2";
    end;

    //Get data to Gen. Journl Line to Bank Account Ledger Entry
    [EventSubscriber(ObjectType::Table, 271, 'OnAfterCopyFromGenJnlLine', '', true, true)]
    local procedure CopyBankAccLedgerEntryFromGenJnlLine(var BankAccountLedgerEntry: Record "Bank Account Ledger Entry"; GenJournalLine: Record "Gen. Journal Line")
    begin
        BankAccountLedgerEntry."Description 2" := GenJournalLine."Description 2";
        BankAccountLedgerEntry.REM_TYPE := GenJournalLine.REM_TYPE;
        BankAccountLedgerEntry.CHG_FROM := GenJournalLine.CHG_FROM;
        BankAccountLedgerEntry."Pick Up By" := GenJournalLine."Pick Up By";
        BankAccountLedgerEntry."Pick Up Method" := GenJournalLine."Pick Up Method";
        BankAccountLedgerEntry."Payment Type" := GenJournalLine."Payment Type";
        BankAccountLedgerEntry."Special Instruction 1" := GenJournalLine."Special Instruction 1";
        BankAccountLedgerEntry."Special Instruction 2" := GenJournalLine."Special Instruction 2";
    end;

    //Gen. Jnl.-Post Line Codeunit
    [EventSubscriber(ObjectType::Codeunit, 12, 'OnPostBankAccOnBeforeBankAccLedgEntryInsert', '', true, true)]
    local procedure UpdateBankAccLedEntry(var BankAccountLedgerEntry: Record "Bank Account Ledger Entry"; var GenJournalLine: Record "Gen. Journal Line"; BankAccount: Record "Bank Account")
    var
        BankAcc: Record "Bank Account";
    begin
        if (BankAccount."No." <> GenJournalLine."Account No.") then
            BankAcc.Get(GenJournalLine."Account No.");
        BankAccountLedgerEntry."Currency Code" := BankAcc."Currency Code";
        BankAccountLedgerEntry."Bank Acc. Posting Group" := BankAcc."Bank Acc. Posting Group";
        if (BankAcc."Currency Code" <> '') then
            BankAccountLedgerEntry.Amount := GenJournalLine.Amount;
    end;
    //End of Gen. Jnl.-Post Line Codeunit

    //Item Jnl.-Post Line Codeunit 
    //Function -> RunWithCheck                -----Negative Stock Validation-----
    [EventSubscriber(ObjectType::Codeunit, 22, 'OnAfterPrepareItem', '', true, true)]
    local procedure NegativeStockValidation(var ItemJnlLineToPost: Record "Item Journal Line")
    var
        RVItemLedger: Record "Item Ledger Entry";
        DVQty: Decimal;
    begin
        if (ItemJnlLineToPost."Entry Type" = 1) OR (ItemJnlLineToPost."Entry Type" = 3) OR (ItemJnlLineToPost."Entry Type" = 5) then begin
            DVQty := 0;
            RVItemLedger.SetCurrentKey("Item No.", "Entry Type", "Variant Code", "Drop Shipment", "Location Code", "Posting Date");
            RVItemLedger.SetRange("Item No.", ItemJnlLineToPost."Item No.");
            // RVItemLedger.SetRange("Variant Code",ItemJnlLineToPost."Variant Code");
            RVItemLedger.SetRange("Location Code", ItemJnlLineToPost."Location Code");
            RVItemLedger.SetFilter("Remaining Quantity", '<>0');
            if RVItemLedger.Find('-') then begin
                repeat
                    DVQty := DVQty + RVItemLedger."Remaining Quantity";
                until RVItemLedger.NEXT = 0;
            end;
            if (DVQty < ItemJnlLineToPost.Quantity) then begin
                ERROR('Negative Inventory. Please check...Item No. : %1', ItemJnlLineToPost."Item No.");
                exit;
            end;
        end;
    end;
    //-----End of Negative Stock Validation-----

    //Get data to Item Journl Line to Item Ledger Entry
    [EventSubscriber(ObjectType::Codeunit, 22, 'OnAfterInitItemLedgEntry', '', true, true)]
    local procedure UpdateItemLedEntry(var NewItemLedgEntry: Record "Item Ledger Entry"; ItemJournalLine: Record "Item Journal Line"; var ItemLedgEntryNo: Integer)
    begin
        NewItemLedgEntry."Description 2" := ItemJournalLine."Description 2";
    end;

    //Get data to Item Journl Line to Value Entry
    [EventSubscriber(ObjectType::Codeunit, 22, 'OnAfterInitValueEntry', '', true, true)]
    local procedure UpdateValueLedEntry(var ValueEntry: Record "Value Entry"; ItemJournalLine: Record "Item Journal Line"; VAR ValueEntryNo: Integer)
    begin
        ValueEntry."Description 2" := ItemJournalLine."Description 2";
    end;
    //End of Item Jnl.-Post Line Codeunit 

    //Sales-Post Codeunit
    //Get data from Sales Header to Gen. Journl Line        PostGLAndCustomer, PostCustomerEntry & PostBalancingEntry
    [EventSubscriber(ObjectType::Table, 81, 'OnAfterCopyGenJnlLineFromSalesHeader', '', true, true)]
    local procedure CopyGenJnlLineFromSalesHeader(SalesHeader: Record "Sales Header"; VAR GenJournalLine: Record "Gen. Journal Line")
    begin
        GenJournalLine."Description 2" := SalesHeader."Description 2";
    end;

    //Get data from Sales Line to Item Journl Line          PostItemJnlLine
    [EventSubscriber(ObjectType::Table, 83, 'OnAfterCopyItemJnlLineFromSalesLine', '', true, true)]
    local procedure ItemJnlLineFromSalesLine(var ItemJnlLine: Record "Item Journal Line"; SalesLine: Record "Sales Line")
    begin
        ItemJnlLine."Description 2" := SalesLine."Description 2";
    end;

    //Get data from Sales Line to Item Journl Line          PostAssocItemJnlLine
    [EventSubscriber(ObjectType::Table, 83, 'OnAfterCopyItemJnlLineFromPurchLine', '', true, true)]
    local procedure ItemJnlLineFromPurchLine(var ItemJnlLine: Record "Item Journal Line"; PurchLine: Record "Purchase Line")
    begin
        ItemJnlLine."Description 2" := PurchLine."Description 2";
    end;
    //End of Sales-Post Codeunit

    //Purch.-Post
    //Get data from Purchase Header to Gen. Journl Line     PostGLAndVendor
    [EventSubscriber(ObjectType::Table, 81, 'OnAfterCopyGenJnlLineFromPurchHeader', '', true, true)]
    local procedure CopyGenJnlLineFromPurchHeader(PurchaseHeader: Record "Purchase Header"; VAR GenJournalLine: Record "Gen. Journal Line")
    begin
        GenJournalLine."Description 2" := PurchaseHeader."Description 2";
    end;

    //Get data from Purchase Line to Item Journl Line          PostItemJnlLine
    [EventSubscriber(ObjectType::Table, 83, 'OnAfterCopyItemJnlLineFromPurchLine', '', true, true)]
    local procedure CopyItemJnlLineFromPurchLine(var ItemJnlLine: Record "Item Journal Line"; PurchLine: Record "Purchase Line")
    begin
        ItemJnlLine."Description 2" := PurchLine."Description 2";
    end;
    //End of Purch.-Post

    //Purch.-Quote to Order
    [EventSubscriber(ObjectType::Codeunit, 96, 'OnCreatePurchHeaderOnBeforeInitRecord', '', true, true)]
    local procedure InsertPurchOrderHeader(var PurchOrderHeader: Record "Purchase Header"; var PurchHeader: Record "Purchase Header")
    var
        NoSeriesManagement: Codeunit NoSeriesManagement;
    begin
        PurchHeader.TestField("PO No. Series");
        PurchOrderHeader."No." := NoSeriesManagement.GetNextNo(PurchHeader."PO No. Series", PurchHeader."Posting Date", true);
        PurchOrderHeader."PO No. Series" := PurchHeader."PO No. Series";
        PurchOrderHeader."Order Date" := WorkDate();
    end;
    //End of Purch.-Quote to Order

    //Req. Wksh.-Make Order
    //Get data from Purchase Line to Item Journl Line          PostItemJnlLine
    [EventSubscriber(ObjectType::Codeunit, 333, 'OnBeforePurchOrderHeaderInsert', '', true, true)]
    local procedure PurchOrderHeaderInsert(VAR PurchaseHeader: Record "Purchase Header"; RequisitionLine: Record "Requisition Line")
    var
        RecNoSerios: Record "No. Series Line";
        LastNoPO: Code[50];
    begin
        RecNoSerios.SETRANGE(RecNoSerios."Series Code", RequisitionLine."No. Series");
        if RecNoSerios.FindFirst() then begin
            LastNoPO := IncStr(RecNoSerios."Last No. Used");
            RecNoSerios."Last No. Used" := LastNoPO;
            RecNoSerios.Modify();
        end;
        PurchaseHeader."No." := LastNoPO;
    end;
    //End of Req. Wksh.-Make Order

    //Format Address                    ---Newly Added Function---
    local procedure CompanyNew(var AddrArray: array[8] of Text[100]; var CompanyInfo: Record "Company Information")
    var
        FormatAddress: Codeunit "Format Address";
    begin
        with CompanyInfo do
            FormatAddress.FormatAddr(AddrArray, Name, "Name 2", Address, "Address 2", "Post Code", '', '', '', '');
    end;
    //End of Format Address

    //Sales Tax Calculate               ---Newly Added Function---
    procedure GetSalesTaxes(TaxAreaCode: Code[20]; TaxGroupCode: Code[10]; TaxLiable: Boolean; Amount: Decimal; Quantity: Decimal; Date: Date; TMPTaxDetailData: Record "Tax Detail" temporary)
    var
        GenJnlLine: Record "Gen. Journal Line";
        MaxAmount: Decimal;
        TaxAmount: Decimal;
        AddedTaxAmount: Decimal;
        TaxBaseAmount: Decimal;
        Initialised: Boolean;
        FirstLine: Boolean;
        RemainingTaxDetails: Integer;
        TaxAreaLine: Record "Tax Area Line";
        LastCalculationOrder: Integer;
        TaxOnTaxCalculated: Boolean;
        CalculationOrderViolation: Boolean;
        TaxDetail: Record "Tax Detail";
    begin
        TaxAmount := 0;
        Initialised := true;
        FirstLine := true;
        RemainingTaxDetails := 0;

        if (TaxAreaCode = '') or (TaxGroupCode = '') then
            exit;

        TaxAreaLine.SetCurrentKey("Tax Area", "Calculation Order");
        TaxAreaLine.Setrange("Tax Area", TaxAreaCode);
        if TaxAreaLine.FIND('+') then begin
            LastCalculationOrder := TaxAreaLine."Calculation Order" + 1;
            TaxOnTaxCalculated := false;
            CalculationOrderViolation := false;
            repeat
                if TaxAreaLine."Calculation Order" >= LastCalculationOrder then
                    CalculationOrderViolation := true
                else
                    LastCalculationOrder := TaxAreaLine."Calculation Order";
                TaxDetail.RESET;
                TaxDetail.Setrange("Tax Jurisdiction Code", TaxAreaLine."Tax Jurisdiction Code");
                if TaxGroupCode = '' then
                    TaxDetail.SetFilter("Tax Group Code", '%1', TaxGroupCode)
                else
                    TaxDetail.SetFilter("Tax Group Code", '%1|%2', '', TaxGroupCode);
                if Date = 0D then
                    TaxDetail.SetFilter("Effective Date", '<=%1', WORKDATE)
                else
                    TaxDetail.SetFilter("Effective Date", '<=%1', Date);
                TaxDetail.Setrange("Tax Type", TaxDetail."Tax Type"::"Sales Tax");
                if TaxDetail.FINDLAST AND ((TaxDetail."Tax Below Maximum" <> 0) OR (TaxDetail."Tax Above Maximum" <> 0)) then begin
                    TaxOnTaxCalculated := TaxOnTaxCalculated OR TaxDetail."Calculate Tax on Tax";
                    if TaxDetail."Calculate Tax on Tax" then
                        TaxBaseAmount := Amount + TaxAmount
                    else
                        TaxBaseAmount := Amount;
                    if TaxLiable then begin
                        if (ABS(TaxBaseAmount) <= TaxDetail."Maximum Amount/Qty.") OR
                           (TaxDetail."Maximum Amount/Qty." = 0)
                        then
                            AddedTaxAmount := TaxBaseAmount * TaxDetail."Tax Below Maximum" / 100
                        else begin
                            MaxAmount := TaxBaseAmount / ABS(TaxBaseAmount) * TaxDetail."Maximum Amount/Qty.";
                            AddedTaxAmount :=
                              ((MaxAmount * TaxDetail."Tax Below Maximum") +
                               ((TaxBaseAmount - MaxAmount) * TaxDetail."Tax Above Maximum")) / 100;
                        end;
                    end
                    else
                        AddedTaxAmount := 0;
                    TaxAmount := TaxAmount + AddedTaxAmount;

                    TMPTaxDetailData.RESET;
                    TMPTaxDetailData.Setrange("Tax Jurisdiction Code", TaxDetail."Tax Jurisdiction Code");
                    if TMPTaxDetailData.FINDFIRST then begin
                        TMPTaxDetailData."Tax Below Maximum" += AddedTaxAmount;
                        TMPTaxDetailData."Tax Above Maximum" += TaxBaseAmount;
                        TMPTaxDetailData.Modify();
                    end
                    else begin
                        TMPTaxDetailData.INIT;
                        TMPTaxDetailData.TRANSFERFIELDS(TaxDetail);
                        TMPTaxDetailData."Tax Below Maximum" := AddedTaxAmount;
                        TMPTaxDetailData."Tax Above Maximum" := TaxBaseAmount;
                        TMPTaxDetailData.INSERT;
                    end;
                    RemainingTaxDetails := RemainingTaxDetails + 1;
                end;
                TaxDetail.Setrange("Tax Type", TaxDetail."Tax Type"::"Excise Tax");
                if TaxDetail.FINDLAST and ((TaxDetail."Tax Below Maximum" <> 0) or (TaxDetail."Tax Above Maximum" <> 0)) then begin
                    if TaxLiable then begin
                        if (ABS(Quantity) <= TaxDetail."Maximum Amount/Qty.") or
                           (TaxDetail."Maximum Amount/Qty." = 0)
                        then
                            AddedTaxAmount := Quantity * TaxDetail."Tax Below Maximum"
                        else begin
                            MaxAmount := Quantity / ABS(Quantity) * TaxDetail."Maximum Amount/Qty.";
                            AddedTaxAmount :=
                              (MaxAmount * TaxDetail."Tax Below Maximum") +
                              ((Quantity - MaxAmount) * TaxDetail."Tax Above Maximum");
                        end;
                    end
                    else
                        AddedTaxAmount := 0;
                    TaxAmount := TaxAmount + AddedTaxAmount;

                    TMPTaxDetailData.RESET;
                    TMPTaxDetailData.Setrange("Tax Jurisdiction Code", TaxDetail."Tax Jurisdiction Code");
                    if TMPTaxDetailData.FINDFIRST then begin
                        TMPTaxDetailData."Tax Below Maximum" += AddedTaxAmount;
                        TMPTaxDetailData."Tax Above Maximum" += TaxBaseAmount;
                        TMPTaxDetailData.MODifY;
                    end
                    else begin
                        TMPTaxDetailData.INIT;
                        TMPTaxDetailData.TRANSFERFIELDS(TaxDetail);
                        TMPTaxDetailData."Tax Below Maximum" += AddedTaxAmount;
                        TMPTaxDetailData."Tax Above Maximum" += TaxBaseAmount;
                        TMPTaxDetailData.INSERT;
                    end;
                    RemainingTaxDetails := RemainingTaxDetails + 1;
                end;
            until TaxAreaLine.NEXT(-1) = 0;
            TMPTaxDetailData.RESET;
        end;
    end;
    //End of Sales Tax Calculate

    //Inventory Posting To G/L
    //Get data from Value Entry to Gen. Journl Line     PostInvtPostBuf
    [EventSubscriber(ObjectType::Codeunit, 5802, 'OnPostInvtPostBufOnAfterInitGenJnlLine', '', true, true)]
    local procedure InvtPostBufOnAfterInitGenJnlLine(var GenJournalLine: Record "Gen. Journal Line"; var ValueEntry: Record "Value Entry")
    begin
        GenJournalLine."Description 2" := ValueEntry."Description 2";
    end;

    //End of Inventory Posting To G/L
}