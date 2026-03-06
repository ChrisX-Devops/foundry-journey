# Day 2: Data Locations Mastery ✅

### Storage vs Memory vs Calldata
| Location | Cost | When to Use | Client Impact |
|----------|------|-------------|---------------|
| Storage | 20,000 gas/write | Permanent data | User pays more, but data stays forever |
| Memory | 3 gas/op | Temporary calculations | Cheap, fast, disappears after function |
| Calldata | 16 gas/byte | Function inputs | Cheapest for external data |

## Professional Insight
**Wrong:** `function foo(uint[] memory x)` when x is external input  
**Right:** `function foo(uint[] calldata x)` — saves client 10-50% gas

## Test Results
- ✅ 2/2 tests passing
- ✅ Gas-optimized patterns demonstrated
- ✅ Ready for production contract work

## Files
- `DataLocations.sol`: Educational contract with all 3 locations

## Next
Day 3: Error handling, events, modifiers (professional standards)
