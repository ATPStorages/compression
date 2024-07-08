package Compression.Deflate is

   type Encoding_Method is (STORED,
                            STATIC_HUFFMAN,
                            DYNAMIC_HUFFMAN,
                            RESERVED)
     with Size => 2;
   for Encoding_Method use (STORED => 0,
                            STATIC_HUFFMAN => 1,
                            DYNAMIC_HUFFMAN => 2,
                            RESERVED => 3);

   type Block_Header is record
      Last   : Boolean;
      Method : Encoding_Method;
   end record with Pack, Size => 3;

end Compression.Deflate;
