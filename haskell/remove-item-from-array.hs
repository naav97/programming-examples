import Data.List

main::IO()
main = do
    let cars = ["Ford", "Volvo", "BMW"]
    print cars
    print (delete "Volvo" cars)
