﻿using System.Collections.Generic;
using System.Threading;
using System.IO;
using System;
using TrueGearSDK;
using System.Linq;


namespace MyTrueGear
{
    public class TrueGearMod
    {
        private static TrueGearPlayer _player = null;

        public TrueGearMod() 
        {
            _player = new TrueGearPlayer("1903340", "Expedition 33");

            //_player.PreSeekEffect("DefaultDamage");

            _player.Start();
        }

        //public void PlayAngle(string tmpEvent, float tmpAngle, float tmpVertical)
        //{
        //    try
        //    {
        //        float angle = (tmpAngle - 22.5f) > 0f ? tmpAngle - 22.5f : 360f - tmpAngle;
        //        int horCount = (int)(angle / 45) + 1;

        //        int verCount = tmpVertical > 0.1f ? -4 : tmpVertical < -0.5f ? 8 : 0;

        //        EffectObject oriObject = _player.FindEffectByUuid(tmpEvent);

        //        EffectObject rootObject = EffectObject.Copy(oriObject);

        //        foreach (TrackObject track in rootObject.trackList)
        //        {
        //            if (track.action_type == ActionType.Shake)
        //            {
        //                for (int i = 0; i < track.index.Length; i++)
        //                {
        //                    if (verCount != 0)
        //                    {
        //                        track.index[i] += verCount;
        //                    }
        //                    if (horCount < 8)
        //                    {
        //                        if (track.index[i] < 50)
        //                        {
        //                            int remainder = track.index[i] % 4;
        //                            if (horCount <= remainder)
        //                            {
        //                                track.index[i] = track.index[i] - horCount;
        //                            }
        //                            else if (horCount <= (remainder + 4))
        //                            {
        //                                var num1 = horCount - remainder;
        //                                track.index[i] = track.index[i] - remainder + 99 + num1;
        //                            }
        //                            else
        //                            {
        //                                track.index[i] = track.index[i] + 2;
        //                            }
        //                        }
        //                        else
        //                        {
        //                            int remainder = 3 - (track.index[i] % 4);
        //                            if (horCount <= remainder)
        //                            {
        //                                track.index[i] = track.index[i] + horCount;
        //                            }
        //                            else if (horCount <= (remainder + 4))
        //                            {
        //                                var num1 = horCount - remainder;
        //                                track.index[i] = track.index[i] + remainder - 99 - num1;
        //                            }
        //                            else
        //                            {
        //                                track.index[i] = track.index[i] - 2;
        //                            }
        //                        }
        //                    }
        //                }
        //                if (track.index != null)
        //                {
        //                    track.index = track.index.Where(i => !(i < 0 || (i > 19 && i < 100) || i > 119)).ToArray();
        //                }
        //            }
        //            else if (track.action_type == ActionType.Electrical)
        //            {
        //                for (int i = 0; i < track.index.Length; i++)
        //                {
        //                    if (horCount <= 4)
        //                    {
        //                        track.index[i] = 0;
        //                    }
        //                    else
        //                    {
        //                        track.index[i] = 100;
        //                    }
        //                    if (horCount == 1 || horCount == 8 || horCount == 4 || horCount == 5)
        //                    {
        //                        track.index = new int[2] { 0, 100 };
        //                    }

        //                }
        //            }
        //        }
        //        _player.SendPlayEffectByContent(rootObject);

        //    }
        //    catch (System.Exception ex)
        //    {
        //        _player.SendPlay(tmpEvent);
        //    }
        //}

        public void Play(string Event)
        { 
            _player.SendPlay(Event);
        }
    }
}
