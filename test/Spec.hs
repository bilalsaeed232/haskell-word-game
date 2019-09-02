import Test.Hspec

import Lib
import Data

main :: IO ()
main = hspec $ do
    describe "Required data for word game" $ do
        it "Should have 10 languages" $ do
            length languages `shouldBe` 10

        it "Should have grid of 12 lines" $ do
            length grid `shouldBe` 12
    describe "findWords()" $ do
        it "Should match length of languages" $ do
            let foundLanguages = length $ findWords grid languages
                in foundLanguages `shouldBe` length languages 