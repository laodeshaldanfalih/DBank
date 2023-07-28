import type { Principal } from '@dfinity/principal';
export interface _SERVICE {
  'compound' : () => Promise<undefined>,
  'showVal' : () => Promise<number>,
  'topUp' : (arg_0: number) => Promise<undefined>,
  'withdraw' : (arg_0: number) => Promise<undefined>,
}
