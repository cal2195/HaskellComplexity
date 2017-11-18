module Shell
  (cloneGitRepo, totalCommits) where

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
