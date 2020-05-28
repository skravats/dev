/*
 * support.c
 *
 *  Created on: May 26, 2020
 *      Author: A90282
 */

#include "support.h"


// 0 - equal
// -1 - not equal
int cmp_s(const char* src1, const int len1, const char* src2, const int len2)
{
   int result = 0, cnt1, cnt2;

   cnt1 = 0;
   cnt2 = 0;
   if(len1 == len2)
   {
      while((*src1 != 0) && (*src2 != 0) && (cnt1++ < len1) && (cnt2++ < len2))
      {
         if(*src1++ != *src2)
         {
            result = -1;
            break;
         }
      }
   }
   else
   {
      result = -1;
   }

   return result;
}


