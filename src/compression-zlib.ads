with Interfaces;
with Interfaces.C.Extensions;

with Checksum;

package Compression.ZLib is

   type Compression_Method is (DEFLATE,
                               RESERVED)
     with Size => 4;
   for Compression_Method use (DEFLATE => 8,
                               RESERVED => 15);

   type Compression_Level is (FASTEST,
                              FAST,
                              DEFAULT,
                              SLOWEST)
     with Size => 2;
   for Compression_Level use (FASTEST => 0,
                              FAST => 1,
                              DEFAULT => 2,
                              SLOWEST => 3);

   type Header_Flags is record
      Check            : Interfaces.C.Extensions.Unsigned_5;
      PresetDictionary : Boolean;
      CompressionLevel : Compression_Level;
   end record with Pack, Size => 8;

   type Header is record
      CompressionMethod : Compression_Method;
      WindowSize        : Interfaces.C.Extensions.Unsigned_4;
      Flags             : Header_Flags;
   end record with Pack, Size => 16;

   type Data (CompressedLength : Interfaces.Unsigned_32) is record
      ZLibHeader : Header;
      Compressed : Checksum.Byte_Array (1 .. CompressedLength);
      Adler32    : Interfaces.Unsigned_32;
   end record with Pack;

end Compression.ZLib;
