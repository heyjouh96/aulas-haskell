{-# LANGUAGE OverloadedStrings #-}

module Cripto where

import Data.Digest.Pure.SHA
import Data.ByteString.Lazy.Char8
    
main = do
    -- print $ sha1 "haskell"
    -- print $ sha256 "haskell"
    -- print $ sha512 "haskell"
    
    -- hmacSha512 passa uma secret key e uma mensagem
    -- computa HMAC usando SHA-512
    -- HMAC é uma construção especifica para calcular o código de autenticação de mensagem (MAC)
    -- envolvendo uma função hash criptografica que nesse caso é o SHA-512
    print $ hmacSha512 "haskell" "hello haskell"