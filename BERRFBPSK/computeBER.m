function BER = computeBER(tx, rx)
    BER = sum(abs(tx - rx)) / length(tx);
end
