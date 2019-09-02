import Test.Hspec

-- User Defined modules
import Lib
import Data

main :: IO ()
main = hspec $ do
    describe "findWords()" $ do
        it "Should find all languages in grid" $ do
            findWords grid languages `shouldBe` languages
        it "Should not find non-existing languages in grid" $ do
            findWords grid ["Erlang", "GO", "Java"] `shouldBe` []

    describe "findWord()" $ do
        it "Should return JUST word if found" $ do
            findWord ["COBOL", "RUBY", "PYTHON"] "PYTHON" `shouldBe` Just "PYTHON"
        it "Should return Nothing with non-existing language in grid" $ do
            findWord ["COBOL", "RUBY", "PYTHON"] "JAVA" `shouldBe` Nothing

    describe "findWordInLine()" $ do
        it "Should return True if word exist in that line" $ do
            findWordInLine "BILAL" "DJFKDJKFJ BILALDFDFDF" `shouldBe` True
        it "Should return False if word doesn't exist in that line" $ do
            findWordInLine "SAEED" "DJFKDJKFJ BILALDFDFDF" `shouldBe` False

    describe "formatGrid()" $ do
        it "Should return string with new line characters" $ do
            formatGrid ["MY", "NAME", "IS", "BILAL"] `shouldBe` "MY\nNAME\nIS\nBILAL\n"
