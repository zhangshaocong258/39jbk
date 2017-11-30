package com.szl.util;

import com.hankcs.hanlp.HanLP;
import com.hankcs.hanlp.seg.common.Term;
import com.szl.dao.RuleDao;
import com.szl.domain.Discase;
import com.szl.domain.Rule;
import com.szl.service.MyService;
import tree.domain.Forest;
import tree.library.Library;
import tree.splitWord.GetWord;
import weka.classifiers.functions.MultilayerPerceptron;
import weka.core.Instances;
import weka.core.converters.ArffLoader;

import java.io.*;
import java.text.DecimalFormat;
import java.util.*;

/**
 * Created by zsc on 2017/11/15.
 * 知识库的构建
 * 三个症状知识库
 * 生成特征
 */
public class Repository {
    private static final String synonymDicPath = "src\\main\\resources\\同义词new.txt";
    private static final String maishePath = "src\\main\\resources\\脉舌词典带标签.txt";
    private static final String caseDataPath = "src\\main\\resources\\合并";
    private static final String featureFolder = "src\\main\\resources\\特征";
    private static final String featureFile = "src\\main\\resources\\特征\\outh.csv";
    private static BufferedWriter bw;
    private static HashMap<String, String> dicHashmap = new HashMap<String, String>();
    private static Forest forest;
    private static Rule x;
    private static Rule g;
    private static Rule p;
    private static HashSet<String> xZhuzheng1Set = new HashSet<String>();
    private static HashSet<String> xZhuzheng2Set = new HashSet<String>();
    private static HashSet<String> xCizhengSet = new HashSet<String>();
    private static HashSet<String> xZhushezhiSet = new HashSet<String>();
    private static HashSet<String> xZhushetaiSet = new HashSet<String>();
    private static HashSet<String> xZhumaiSet = new HashSet<String>();
    private static HashSet<String> xCishezhiSet = new HashSet<String>();
    private static HashSet<String> xCishetaiSet = new HashSet<String>();
    private static HashSet<String> xCimaiSet = new HashSet<String>();

    private static HashSet<String> gZhuzheng1LeftSet = new HashSet<String>();
    private static HashSet<String> gZhuzheng1RightSet = new HashSet<String>();
    private static HashSet<String> gZhuzheng2LeftSet = new HashSet<String>();
    private static HashSet<String> gZhuzheng2RightSet = new HashSet<String>();
    private static HashSet<String> gZhuzheng3Set = new HashSet<String>();
    private static HashSet<String> gCizhengSet = new HashSet<String>();
    private static HashSet<String> gZhushezhiSet = new HashSet<String>();
    private static HashSet<String> gZhushetaiSet = new HashSet<String>();
    private static HashSet<String> gZhumaiSet = new HashSet<String>();
    private static HashSet<String> gCishezhiSet = new HashSet<String>();
    private static HashSet<String> gCishetaiSet = new HashSet<String>();
    private static HashSet<String> gCimaiSet = new HashSet<String>();

    private static HashSet<String> pZhuzheng1Set = new HashSet<String>();
    private static HashSet<String> pZhuzheng2Set = new HashSet<String>();
    private static HashSet<String> pCizhengSet= new HashSet<String>();
    private static HashSet<String> pZhushezhiSet = new HashSet<String>();
    private static HashSet<String> pZhushetaiSet = new HashSet<String>();
    private static HashSet<String> pZhumaiSet = new HashSet<String>();
    private static HashSet<String> pCishezhiSet = new HashSet<String>();
    private static HashSet<String> pCishetaiSet = new HashSet<String>();
    private static HashSet<String> pCimaiSet = new HashSet<String>();
    private static DecimalFormat df = new DecimalFormat("######0.0000");

    private static List<String> matchList = new ArrayList<String>();

//    public static void main(String args[]) throws Exception {
//        readDic(synonymDicPath);
//        readForest(maishePath);
//        genRepository();
//        genRepositoryWithoutRule();
//        createFile(featureFolder, featureFile);
//        genFeature(caseDataPath);
//        bw.close();
////        doGenFeature(new File("src\\main\\resources\\心气虚证\\xinqixu12.txt"));
////        bw.close();
//
//
//
//    }

    /**
     * 读取病例数据
     *
     * @param file
     * @throws Exception
     */
    public static void readDic(File file) throws Exception {
        BufferedReader br = new BufferedReader(new InputStreamReader(new FileInputStream(file), "UTF-8"));
        String line;
        while ((line = br.readLine()) != null) {
            String[] strings = line.split("：|,");
            String coding = strings[0].trim();
            for (int i = 1; i < strings.length; i++) {
                if (dicHashmap.containsKey(strings[i])) {
                    throw new Exception("重复的key");
                } else {
                    dicHashmap.put(strings[i].trim(), coding);
                }
            }
        }
    }

    public static void readForest(File file) throws Exception {
        forest = Library.makeForest(new BufferedReader(new InputStreamReader(
                new FileInputStream(file), "UTF-8")));
    }

    public static void genRepository(RuleDao ruleDao) {
        x = ruleDao.selectRuleByName("x");
        g = ruleDao.selectRuleByName("g");
        p = ruleDao.selectRuleByName("p");
        //心气虚
        String[] xZhuzhengs = x.getZhuzheng().split(",");
        for (String zhengzhuang : xZhuzhengs) {
            if (zhengzhuang.startsWith("!")) {
                xZhuzheng1Set.add(zhengzhuang.substring(1, zhengzhuang.length()));
            } else {
                xZhuzheng2Set.add(zhengzhuang);
            }
        }
        xCizhengSet.addAll(Arrays.asList(x.getCizheng().split(",")));
        xZhushezhiSet.addAll(Arrays.asList(x.getZhushezhi().split(",")));
        xCishezhiSet.addAll(Arrays.asList(x.getCishezhi().split(",")));
        xZhushetaiSet.addAll(Arrays.asList(x.getZhushetai().split(",")));
        xCishetaiSet.addAll(Arrays.asList(x.getCishetai().split(",")));
        xZhumaiSet.addAll(Arrays.asList(x.getZhumai().split(",")));
        xCimaiSet.addAll(Arrays.asList(x.getCimai().split(",")));

        //肝肾
        String[] gZhuzhengs = g.getZhuzheng().split(",");
        for (String zhengzhuang : gZhuzhengs) {
            if (zhengzhuang.startsWith("!")) {
                String temp = zhengzhuang.substring(1, zhengzhuang.length());
                if (temp.equals("aaz") || temp.equals("aax")) {
                    gZhuzheng1LeftSet.add(temp);
                } else {
                    gZhuzheng1RightSet.add(temp);
                }
            } else if (zhengzhuang.startsWith("@")) {
                String temp = zhengzhuang.substring(1, zhengzhuang.length());
                if (temp.equals("abn") || temp.equals("abm") || temp.equals("acj") || temp.equals("ack") || temp.equals("acl")) {
                    gZhuzheng2LeftSet.add(temp);
                } else {
                    gZhuzheng2RightSet.add(temp);
                }
            } else if (zhengzhuang.startsWith("#")) {
                gZhuzheng3Set.add(zhengzhuang.substring(1, zhengzhuang.length()));
            }
        }
        gCizhengSet.addAll(Arrays.asList(g.getCizheng().split(",")));
        gZhushezhiSet.addAll(Arrays.asList(g.getZhushezhi().split(",")));
        gCishezhiSet.addAll(Arrays.asList(g.getCishezhi().split(",")));
        gZhushetaiSet.addAll(Arrays.asList(g.getZhushetai().split(",")));
        gCishetaiSet.addAll(Arrays.asList(g.getCishetai().split(",")));
        gZhumaiSet.addAll(Arrays.asList(g.getZhumai().split(",")));
        gCimaiSet.addAll(Arrays.asList(g.getCimai().split(",")));


        //脾胃
        String[] pZhuzhengs = p.getZhuzheng().split(",");
        for (String zhengzhuang : pZhuzhengs) {
            if (zhengzhuang.startsWith("!")) {
                pZhuzheng1Set.add(zhengzhuang.substring(1, zhengzhuang.length()));
            } else {
                pZhuzheng2Set.add(zhengzhuang);
            }
        }
        pCizhengSet.addAll(Arrays.asList(p.getCizheng().split(",")));
        pZhushezhiSet.addAll(Arrays.asList(p.getZhushezhi().split(",")));
        pCishezhiSet.addAll(Arrays.asList(p.getCishezhi().split(",")));
        pZhushetaiSet.addAll(Arrays.asList(p.getZhushetai().split(",")));
        pCishetaiSet.addAll(Arrays.asList(p.getCishetai().split(",")));
        pZhumaiSet.addAll(Arrays.asList(p.getZhumai().split(",")));
        pCimaiSet.addAll(Arrays.asList(p.getCimai().split(",")));



    }

    /**
     * 创建输出文件
     *
     * @param output
     * @param outFile
     * @throws Exception
     */
    private static void createFile(String output, String outFile) throws Exception {
        File file = new File(output);
        if (!file.exists()) {
            file.mkdirs();
        }
        file = new File(outFile);
        if (!file.exists()) {
            file.createNewFile();
        }
        bw = new BufferedWriter(new OutputStreamWriter(new FileOutputStream(file), "UTF-8"));
    }

    /**
     * 遍历数据，生成特征
     *
     * @param path
     */
    private static void genFeature(String path) throws Exception {
        File folder = new File(path);
        if (folder.isFile()) {
            doGenFeature(folder);
        } else if (folder.isDirectory()) {
            File[] files = folder.listFiles();
            for (File file : files) {
                genFeature(file.getAbsolutePath());
            }
        }
    }

    /**
     * 生成特征具体实现
     *
     * @param file
     */
    private static void doGenFeature(File file) throws Exception {
//        System.out.println(file.getName());
        //对病例文件进行处理，生成list
        List<String> zhengzhuangList;
        List<String> shezhiList;
        List<String> shetaiList;
        List<String> maiList;
        BufferedReader br = new BufferedReader(new InputStreamReader(new FileInputStream(file), "UTF-8"));
        br.readLine();
        String medicalHis = br.readLine().split(":")[1].trim();
        String examine = br.readLine().split(":")[1].trim();
        String sheZhi = "";
        String sheTai = "";
        String maiXiang = "";
        String[] strings = examine.split(",|，|。|、|;|；");
        for (int i = 0; i < strings.length; i++) {
            if (strings[i].startsWith("舌质") || strings[i].startsWith("质")) {
                sheZhi = strings[i];
            } else if (strings[i].startsWith("舌苔") || strings[i].startsWith("苔")) {
                sheTai = strings[i];
            } else if (strings[i].startsWith("脉")) {
                maiXiang = strings[i];
            }
        }
        String segExamine = new StringBuilder().append(getSymptom(HanLP.segment(medicalHis)).toString()).
                append(getSymptom(HanLP.segment(examine)).toString()).toString();
        String segSheZhi = getSegResult(forest, sheZhi);
        String segSheTai = getSegResult(forest, sheTai);
        String segMaiXiang = getSegResult(forest, maiXiang);
        zhengzhuangList = Arrays.asList(segExamine.split(","));
        shezhiList = Arrays.asList(segSheZhi.split(","));
        shetaiList = Arrays.asList(segSheTai.split(","));
        maiList = Arrays.asList(segMaiXiang.split(","));
//        System.out.println("seg1 " + segExamine);
//        System.out.println("seg2 " + segSheZhi);
//        System.out.println("seg3 " + segSheTai);
//        System.out.println("seg4 " + segMaiXiang);
        List<String> list = matchRule(zhengzhuangList, shezhiList, shetaiList, maiList);



        for (String str : list) {
            bw.write(str);
            bw.write(",");
        }
        bw.write(file.getName().substring(0, 1));
        bw.newLine();
    }


    private static void genRepositoryWithoutRule() {
        //规则库初始化
        String head = "aaa";
        matchList.add(head);
        for (int i = 0; i < 96; i++) {
            char[] chars = head.toCharArray();
            if (chars[2] >= 122) {
                if (chars[1] >= 122) {
                    if (chars[0] >= 122) {
                        throw new IndexOutOfBoundsException();
                    } else {
                        chars[0] += 1;
                        chars[1] = 'a';
                        chars[2] = 'a';
                    }
                } else {
                    chars[1] += 1;
                    chars[2] = 'a';
                }
            } else {
                chars[2] += 1;
            }
            head = String.valueOf(chars);
            matchList.add(head);
        }
        String[] shezhiStr = "淡红 淡白 红 白 绛 青 紫 老 嫩 胖 瘦 点 刺 裂 齿".split(" ");
        String[] shetaiStr = "厚 薄 润 燥 少津 腻 腐 剥落 真 假 少 无 白 黄 灰黑".split(" ");
        String[] maiStr = "浮 沉 迟 数 洪 细 虚 实 滑 涩 弦 紧 结 代 促 长 短 缓 濡 弱 微 散 芤 伏 牢 革 动 疾".split(" ");

        matchList.addAll(Arrays.asList(shezhiStr));
        matchList.addAll(Arrays.asList(shetaiStr));
        matchList.addAll(Arrays.asList(maiStr));

    }


    /**
     *
     * @param zhengzhuangList
     * @param shezhiList
     * @param shetaiList
     * @param maiList
     * @return
     */

    private static List<String> matchWithoutRule(List<String> zhengzhuangList, List<String> shezhiList, List<String> shetaiList,
                                                 List<String> maiList) {

        List<String> list = new ArrayList<String>();
        HashSet<String> zhengzhuangHashSet = new HashSet<String>();
        HashSet<String> shezhiHashSet = new HashSet<String>(shezhiList);
        HashSet<String> shetaiHashSet = new HashSet<String>(shetaiList);
        HashSet<String> maiHashSet = new HashSet<String>(maiList);

        for (String s : zhengzhuangList) {
            zhengzhuangHashSet.add(dicHashmap.get(s));
        }


        for (int i = 0; i < matchList.size(); i++) {
            if (i <= 95) {
                if (zhengzhuangHashSet.contains(matchList.get(i))) {
                    list.add("1");
                } else {
                    list.add("0");
                }
            } else if (i > 95 && i <= 110) {
                if (shezhiHashSet.contains(matchList.get(i))) {
                    list.add("2");
                } else {
                    list.add("0");
                }
            } else if (i > 110 && i <= 125) {
                if (shetaiHashSet.contains(matchList.get(i))) {
                    list.add("3");
                } else {
                    list.add("0");
                }
            } else {
                if (maiHashSet.contains(matchList.get(i))) {
                    list.add("4");
                } else {
                    list.add("0");
                }
            }
        }

        return list;
    }


    /**
     * 对得到的病例list数据进行匹配
     *
     * @param zhengzhuangList
     * @param shezhiList
     * @param shetaiList
     * @param maiList
     */
    public static List<String> matchRule(List<String> zhengzhuangList, List<String> shezhiList, List<String> shetaiList,
                                           List<String> maiList) {
        List<String> list = new ArrayList<String>();
        int xZhuzheng1 = 0;
        int xZhuzheng2 = 0;
        int xCizheng = 0;
        int xZhushezhi = 0;
        int xZhushetai = 0;
        int xZhumai = 0;
        int xCishezhi = 0;
        int xCishetai = 0;
        int xCimai = 0;

        int gZhuzheng1Left = 0;
        int gZhuzheng1Right = 0;
        int gZhuzheng2Left = 0;
        int gZhuzheng2Right = 0;
        int gZhuzheng3 = 0;
        int gCizheng = 0;
        int gZhushezhi = 0;
        int gZhushetai = 0;
        int gZhumai = 0;
        int gCishezhi = 0;
        int gCishetai = 0;
        int gCimai = 0;

        int pZhuzheng1 = 0;
        int pZhuzheng2 = 0;
        int pCizheng = 0;
        int pZhushezhi = 0;
        int pZhushetai = 0;
        int pZhumai = 0;
        int pCishezhi = 0;
        int pCishetai = 0;
        int pCimai = 0;

        //统计个数
        for (String zhengzhuang : zhengzhuangList) {
            if (xZhuzheng1Set.contains(dicHashmap.get(zhengzhuang))) {
                xZhuzheng1++;
            } 
            if (xZhuzheng2Set.contains(dicHashmap.get(zhengzhuang))) {
                xZhuzheng2++;
            }
            if (xCizhengSet.contains(dicHashmap.get(zhengzhuang))) {
                xCizheng++;
            }


            if (gZhuzheng1LeftSet.contains(dicHashmap.get(zhengzhuang))) {
                gZhuzheng1Left++;
            }
            if (gZhuzheng1RightSet.contains(dicHashmap.get(zhengzhuang))) {
                gZhuzheng1Right++;
            }
            if (gZhuzheng2LeftSet.contains(dicHashmap.get(zhengzhuang))) {
                gZhuzheng2Left++;
            }
            if (gZhuzheng2RightSet.contains(dicHashmap.get(zhengzhuang))) {
                gZhuzheng2Right++;
            }
            if (gZhuzheng3Set.contains(dicHashmap.get(zhengzhuang))) {
                gZhuzheng1Left++;
            }
            if (gZhuzheng3Set.contains(dicHashmap.get(zhengzhuang))) {
                gZhuzheng3++;
            }
            if (gCizhengSet.contains(dicHashmap.get(zhengzhuang))) {
                gCizheng++;
            }


            if (pZhuzheng1Set.contains(dicHashmap.get(zhengzhuang))) {
                pZhuzheng1++;
            }
            if (pZhuzheng2Set.contains(dicHashmap.get(zhengzhuang))) {
                pZhuzheng2++;
            }
            if (pCizhengSet.contains(dicHashmap.get(zhengzhuang))) {
                pCizheng++;
            }
        }

        for (String shezhi : shezhiList) {
            if (xZhushezhiSet.contains(shezhi)) {
                xZhushezhi++;
            }
            if (xCishezhiSet.contains(shezhi)) {
                xCishezhi++;
            }


            if (gZhushezhiSet.contains(shezhi)) {
                gZhushezhi++;
            }
            if (gCishezhiSet.contains(shezhi)) {
                gCishezhi++;
            }
            
            if (pZhushezhiSet.contains(shezhi)) {
                pZhushezhi++;
            }
            if (pCishezhiSet.contains(shezhi)) {
                pCishezhi++;
            }
        }

        for (String shetai : shetaiList) {
            if (xZhushetaiSet.contains(shetai)) {
                xZhushetai++;
            }
            if (xCishetaiSet.contains(shetai)) {
                xCishetai++;
            }

            if (gZhushetaiSet.contains(shetai)) {
                gZhushetai++;
            }
            if (gCishetaiSet.contains(shetai)) {
                gCishetai++;
            }
            
            
            if (pZhushetaiSet.contains(shetai)) {
                pZhushetai++;
            }
            if (pCishetaiSet.contains(shetai)) {
                pCishetai++;
            }
        }

        for (String mai : maiList) {
            if (xZhumaiSet.contains(mai)) {
                xZhumai++;
            }
            if (xCimaiSet.contains(mai)) {
                xCimai++;
            }

            if (gZhumaiSet.contains(mai)) {
                gZhumai++;
            }
            if (gCimaiSet.contains(mai)) {
                gCimai++;
            }
            
            
            if (pZhumaiSet.contains(mai)) {
                pZhumai++;
            }
            if (pCimaiSet.contains(mai)) {
                pCimai++;
            }
        }

        //xRule1,主舌,主脉
        list.add(df.format(Math.min(((double) xZhuzheng1 + xZhuzheng2) / 4, 1)));
        list.add("1");
        list.add(df.format((double) xZhushetai));
        list.add(df.format(((double) xZhushezhi / 2)));
        list.add(df.format((double) xZhumai));

        //xRule2
//        System.out.println("zhuzheng1 " + xZhuzheng1 + " 2 " + xZhuzheng2);
        list.add(df.format(0.5 * Math.min(xZhuzheng1, 1) + 0.5 * (Math.min((double) xZhuzheng2 / 2, 1.0))));
        list.add(df.format(Math.min(xCizheng, 1)));//一个或见证
        list.add(df.format((double) xZhushezhi));
        list.add(df.format((double) xZhushetai / 2));
        list.add(df.format((double) xZhumai));

        //xRule3,任何舌脉
        list.add(df.format(0.5 * Math.min(xZhuzheng1, 1) + 0.5 * (Math.min((double) xZhuzheng2 / 2, 1.0))));
        list.add(df.format(Math.min((double) xCizheng / 2, 1)));
        list.add(df.format(Math.min(xZhushezhi + xCishezhi, 1)));
        list.add(df.format(Math.min(xZhushetai + xCishetai, 1)));
        list.add(df.format(Math.min(xZhumai + xCimai, 1)));

        //gRule1
        list.add(df.format((double) 1 / 3 * Math.min(((double) gZhuzheng1Left + gZhuzheng1Right) / 2, 1) +
                (double) 1 / 3 * Math.min(((double) gZhuzheng2Left + gZhuzheng2Right) / 2, 1) +
                (double) 1 / 3 * Math.min((double) gZhuzheng3 / 3, 1)));
        list.add("1");
        list.add(df.format((double) gZhushetai));
        list.add(df.format((double) gZhushezhi));
        list.add(df.format((double) xZhumai));

        //gRule2
        list.add(df.format((double) 1 / 3 * Math.min(((double) gZhuzheng1Left + gZhuzheng1Right) / 2, 1) +
                (double) 1 / 3 * Math.min((double) gZhuzheng2Left + gZhuzheng2Right, 1) +
                (double) 1 / 3 * Math.min((double) gZhuzheng3 / 3, 1)));
        list.add(df.format(Math.min(gCizheng, 1)));
        list.add(df.format(Math.min(gZhushezhi + gCishezhi, 1)));
        list.add(df.format(Math.min(gZhushetai + gCishetai, 1)));
        list.add(df.format(Math.min(gZhumai + gCimai, 1)));

        //gRule3
        list.add(df.format((double) 1 / 3 * Math.min(gZhuzheng1Left, 1) +
                (double) 1 / 3 * Math.min(((double) gZhuzheng2Left + gZhuzheng2Right) / 2, 1) +
                (double) 1 / 3 * Math.min((double) gZhuzheng3 / 3, 1)));
        list.add(df.format(Math.min(gCizheng, 1)));
        list.add(df.format(Math.min(gZhushezhi + gCishezhi, 1)));
        list.add(df.format(Math.min(gZhushetai + gCishetai, 1)));
        list.add(df.format(Math.min(gZhumai + gCimai, 1)));

        //gRule4
        list.add(df.format((double) 1 / 3 * Math.min(gZhuzheng1Left, 1) +
                (double) 1 / 3 * Math.min(gZhuzheng2Left / 5, 1) +
                (double) 1 / 3 * Math.min((double) gZhuzheng3 / 3, 1)));
        list.add(df.format(Math.min((double) gCizheng / 3, 1)));
        list.add(df.format(Math.min(gZhushezhi + gCishezhi, 1)));
        list.add(df.format(Math.min(gZhushetai + gCishetai, 1)));
        list.add(df.format(Math.min(gZhumai + gCimai, 1)));

        //pRule1
        list.add(df.format(Math.min((double) (pZhuzheng1 + pZhuzheng2) / 4, 1)));
        list.add("1");
        list.add(df.format((double) pZhushetai / 4));
        list.add(df.format(((double) pZhushezhi)));
        list.add(df.format((double) pZhumai));

        //pRule2
        list.add(df.format(Math.min((double) (pZhuzheng1 + pZhuzheng2) / 4, 1)));
        list.add(df.format(Math.min(pCizheng, 1)));//一个或见证
        list.add(df.format(Math.min(pZhushezhi + pCishezhi, 1)));
        list.add(df.format(Math.min(pZhushetai + pCishetai, 1)));
        list.add(df.format(Math.min(pZhumai + pCimai, 1)));

        //pRule3
        list.add(df.format(Math.min(((double) pZhuzheng1 + pZhuzheng2) / 3, 1)));
        list.add(df.format(Math.min((double) pCizheng / 2, 1)));
        list.add(df.format((double) pZhushetai / 4));
        list.add(df.format(((double) pZhushezhi)));
        list.add(df.format(Math.min(pZhumai + pCimai, 1)));

        //pRule4
        list.add(df.format(Math.min(((double) pZhuzheng1) / 2, 1)));
        list.add(df.format(Math.min((double) pCizheng / 3, 1)));
        list.add(df.format(Math.min(pZhushezhi + pCishezhi, 1)));
        list.add(df.format(Math.min(pZhushetai + pCishetai, 1)));
        list.add(df.format(Math.min(pZhumai + pCimai, 1)));
        return list;

    }

    /**
     * 得到分词后的脉舌字符串信息
     * @param forest
     * @param content
     * @return
     */
    public static String getSegResult(Forest forest, String content) {
        GetWord udg = forest.getWord(content);
        StringBuilder sb = new StringBuilder();
        String temp;
        while ((temp = udg.getFrontWords()) != null){
            if (udg.getParam(0).equals("maishe")) {
                sb.append(temp).append(",");
            }
        }
        return sb.toString();
    }

    /**
     * 过滤得到症状
     * @param termList 待过滤的字符串
     * @return 过滤后的症状字符串
     */
    public static String getSymptom(List<Term> termList) {
        List<Term> temp = new ArrayList<Term>();
        for (int i = 0; i < termList.size(); i++) {
            Term term = termList.get(i);
            String nature = term.nature != null ? term.nature.toString() : "空";
            if (!nature.equals("symptom")) {
                temp.add(term);
            }
        }
        termList.removeAll(temp);
        StringBuilder sb = new StringBuilder();
        for (Term term : termList) {
            sb.append(term.toString()).append(",");
        }
        int length = sb.toString().length();
        return sb.toString();
    }

    public static void train(File modelFile, File trainFile, File formatFile, List<Discase> discaseList) throws Exception{
        System.out.println("训练 " + discaseList.size());
        //重写train.arff
        BufferedReader br = new BufferedReader(new InputStreamReader(new FileInputStream(formatFile), "UTF-8"));
        BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(new FileOutputStream(trainFile), "UTF-8"));
        HashMap<String, String> hashMap = new HashMap<String, String>();
        hashMap.put("心气虚", "x");
        hashMap.put("肝肾阴虚", "g");
        hashMap.put("脾胃虚弱", "p");
        String line;
        while ((line = br.readLine()) != null) {
            bw.write(line);
            bw.newLine();
        }
        for (Discase discase : discaseList) {
            List<String> zhengzhuangList;
            List<String> shezhiList;
            List<String> shetaiList;
            List<String> maiList;
            String medicalHis = discase.getMedicalHis().split(":")[1].trim();
            String examine = discase.getExamine().split(":")[1].trim();
            String sheZhi = "";
            String sheTai = "";
            String maiXiang = "";
            String[] strings = examine.split(",|，|。|、|;|；");
            for (int i = 0; i < strings.length; i++) {
                if (strings[i].startsWith("舌质") || strings[i].startsWith("质")) {
                    sheZhi = strings[i];
                } else if (strings[i].startsWith("舌苔") || strings[i].startsWith("苔")) {
                    sheTai = strings[i];
                } else if (strings[i].startsWith("脉")) {
                    maiXiang = strings[i];
                }
            }
            String segExamine = new StringBuilder().append(getSymptom(HanLP.segment(medicalHis)).toString()).
                    append(getSymptom(HanLP.segment(examine)).toString()).toString();
            String segSheZhi = getSegResult(forest, sheZhi);
            String segSheTai = getSegResult(forest, sheTai);
            String segMaiXiang = getSegResult(forest, maiXiang);
            zhengzhuangList = Arrays.asList(segExamine.split(","));
            shezhiList = Arrays.asList(segSheZhi.split(","));
            shetaiList = Arrays.asList(segSheTai.split(","));
            maiList = Arrays.asList(segMaiXiang.split(","));
            List<String> list = matchRule(zhengzhuangList, shezhiList, shetaiList, maiList);
            for (String str : list) {
                bw.write(str);
                bw.write(",");
            }
            bw.write(hashMap.get(discase.getDisease().split(":")[1].trim()));
            bw.newLine();
        }
        bw.close();

        ObjectOutputStream oos = new ObjectOutputStream (new FileOutputStream(modelFile));
        ArffLoader arffLoader = new ArffLoader();
        arffLoader.setFile(trainFile);
        Instances instancesTrain = arffLoader.getDataSet();
        instancesTrain.setClassIndex(instancesTrain.numAttributes() - 1);
        MultilayerPerceptron classifier = new MultilayerPerceptron();
        classifier.buildClassifier(instancesTrain);
        oos.writeObject(classifier);
        oos.close();
    }

    public static List<DiseaseInf> predict(File modelFile, File tempFile ,File formatFile ,List<String> zhengzhuangList, List<String> shezhiList, List<String> shetaiList, List<String> maiList) throws Exception {
        //生成特征
        List<String> list = Repository.matchRule(zhengzhuangList, shezhiList, shetaiList, maiList);
        System.out.println("list " + list.toString());

        //生成临时文件用于预测
        BufferedReader br = new BufferedReader(new InputStreamReader(new FileInputStream(formatFile), "UTF-8"));
        BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(new FileOutputStream(tempFile), "UTF-8"));
        String line;
        while ((line = br.readLine()) != null) {
            bw.write(line);
            bw.newLine();
        }
        for (String str : list) {
            bw.write(str);
            bw.write(",");
        }
        bw.write("x");
        bw.newLine();
        bw.close();

        //读入模型进行预测
        ObjectInputStream ois = new ObjectInputStream(new FileInputStream(modelFile));
        MultilayerPerceptron classifier = (MultilayerPerceptron) ois.readObject();
        ArffLoader arffLoader = new ArffLoader();
        arffLoader.setFile(tempFile);
        Instances instancesTest = arffLoader.getDataSet();
        instancesTest.setClassIndex(instancesTest.numAttributes() - 1);
        double[] probability = classifier.distributionForInstance(instancesTest.instance(0));
        List<DiseaseInf> result = new ArrayList<DiseaseInf>();
        result.add(new DiseaseInf("心气虚证","本证是因为禀赋不足，或年高脏气衰弱，或久病失养，或劳倦内伤，以及各种损伤气血的原因致心气不足，以心悸为主要的表现证候。",df.format(probability[0])));
        result.add(new DiseaseInf("肝肾阴虚证","本证是由情志内伤，劳伤精血，或因久病不愈，房事不节耗伤肝肾之阴，以致阴液亏虚，虚阳亢动所表现的证候。",df.format(probability[1])));
        result.add(new DiseaseInf("脾胃虚弱证","本证是由于饮食失调，或思虑过度，或劳倦，或外邪着里，或脏腑传变，内伤脾气；或先天禀赋不足，体素虚弱，而致脾气虚弱，健运失司所表现的证候。",df.format(probability[2])));
        Collections.sort(result);
        return result;

    }


}
