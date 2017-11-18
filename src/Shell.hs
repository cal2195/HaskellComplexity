module Shell
  (cloneGitRepo, totalCommits, resetMaster, resetToPrevCommit, computeComplex, fetchDeps) where

import           Control.Monad
import           System.Process

fetchDeps :: IO String
fetchDeps = do
  readProcess "rm" ["-rf", "deps"] ""
  result <- readProcess "git" ["clone", "https://github.com/cal2195/haskell-deps.git", "deps"] ""
  return result

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
  result <- readProcess "./deps/compute.sh" [] ""
  let total = read result
  return total
