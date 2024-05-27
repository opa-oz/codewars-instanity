local function DNA_strand(dna)
    return dna:gsub(".", { A = "T", T = "A", C = "G", G = "C" })
end

return DNA_strand
