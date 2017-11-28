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
  result <- readProcess "sh" ["-c", "git -C repo log --first-parent --pretty=oneline master | wc -l"] ""
  let total = read result
  return total

resetMaster :: IO String
resetMaster = do
  result <- readProcess "git" ["-C", "repo", "reset", "--hard", "origin/master"] ""
  return result

resetToPrevCommit :: Integer -> IO String
resetToPrevCommit num = do
  result <- readProcess "git" ["-C", "repo", "reset", "--hard", ("HEAD~" ++ (show num))] ""
  return result

computeComplex :: IO Integer
computeComplex = do
  result <- readProcess "sh" ["-c", "argon repo | awk -F '[()]' '{print $2}' | grep -Eo '[0-9]{1,4}' | awk '{s+=$1} END {print s}'"] ""
  let total = read result
  return total
