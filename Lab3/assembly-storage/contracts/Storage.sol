pragma solidity >0.5.0;

contract Storage {
    bytes4  bytes4data = 0xaabbccdd;
    uint72  uintdata = 0x123456;
    bool    booldata = true;
    address addrdata = 0xdC962cEAb6C926E3a9B133c46c7258c0E371b82b;

    function getData() public view returns (bytes4,uint64,bool,address) {
        assembly {
            // return the values of bytes4data, uintdata, booldata, addrdata
            let bytes4data := sload(bytes4data_slot)
            let uintdata := sload(uintdata_slot)
            let booldata := sload(booldata_slot)
            let addrdata := sload(addrdata_slot)

            let result1 :=  and(shr(shl(3,bytes4data_offset), bytes4data, 0xff)
            let result2 :=  and(shr(shl(3,uintdata_offset), uintdata, 0xff)
            let result3 :=  and(shr(shl(3,booldata_offset), booldata, 0xff)
            let result4 :=  and(shr(shl(3,addrdata_offset), addrdata, 0xff)

            mstore(0, result3)
            mstore(0x20, result4) // 0x20 is 32 bytes as result3 occupied 32 bytes
            // output := return(0,32)
            bytes4 := result1
            uint64 := result2
            bool := result3
            address := result4
        }
    }
}