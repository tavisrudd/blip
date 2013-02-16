{-# LANGUAGE RecordWildCards #-}
-----------------------------------------------------------------------------
-- |
-- Module      : Utils
-- Copyright   : (c) 2012, 2013 Bernie Pope
-- License     : BSD-style
-- Maintainer  : florbitous@gmail.com
-- Stability   : experimental
-- Portability : ghc
--
-- Utility functions which are used in multiple modules, or don't belong
-- anywhere else.
--
-----------------------------------------------------------------------------
module Utils (isJump, isRelativeJump, isAbsoluteJump, isJumpBytecode) where

import Blip.Bytecode (Opcode (..), Bytecode (..))

isJumpBytecode :: Bytecode -> Bool
isJumpBytecode (Bytecode {..}) = isJump opcode

-- test if an opcode is a jump instruction
isJump :: Opcode -> Bool
isJump x = isRelativeJump x || isAbsoluteJump x

isRelativeJump :: Opcode -> Bool
isRelativeJump JUMP_FORWARD = True
isRelativeJump SETUP_LOOP = True
isRelativeJump FOR_ITER = True
isRelativeJump SETUP_FINALLY = True
isRelativeJump SETUP_EXCEPT = True
isRelativeJump SETUP_WITH = True
isRelativeJump _ = False

isAbsoluteJump :: Opcode -> Bool
isAbsoluteJump POP_JUMP_IF_FALSE = True
isAbsoluteJump POP_JUMP_IF_TRUE = True
isAbsoluteJump JUMP_ABSOLUTE = True
isAbsoluteJump CONTINUE_LOOP = True
isAbsoluteJump JUMP_IF_FALSE_OR_POP = True
isAbsoluteJump JUMP_IF_TRUE_OR_POP = True
isAbsoluteJump _ = False
