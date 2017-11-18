module Shell
  (cloneGitRepo, totalCommits, resetMaster, resetToPrevCommit, computeComplex) where

import           Control.Monad
import           System.Process

cloneGitRepo :: String -> IO String
cloneGitRepo repo = do
  readProcess "rm" ["-rf", "repo"] ""
  result <- readProcess "git" ["clone", repo, "repo"] ""
  return result

totalCommits :: IO Integer
totalCommits = do
  result <- readProcess "git" ["rev-list", "--count", "master"] ""
  let total = read result
  return total

resetMaster :: IO String
resetMaster = do
  result <- readProcess "git" ["checkout", "master"] ""
  return result

resetToPrevCommit :: Integer -> IO String
resetToPrevCommit num = do
  result <- readProcess "git" ["reset", "--hard", ("HEAD~" ++ (show num))] ""
  return result

computeComplex :: IO Integer
computeComplex = do
  result <- readProcess "./compute.sh" [] ""
  let total = read result
  return total
