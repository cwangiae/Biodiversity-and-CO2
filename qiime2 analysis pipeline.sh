# 数据处理

#导入双端数据，生成 .qza
  qiime tools import \
  --type "SampleData[PairedEndSequencesWithQuality]" \
  --input-path ./manifest-15.txt \
  --output-path ./paired-end-demux.qza \
  --input-format PairedEndFastqManifestPhred33V2

#可视化 .qza变为.qzv 检查样品序列和测序深度
  qiime demux summarize \
  --i-data ./paired-end-demux.qza \
  --o-visualization ./paired-end-demux.qzv

#数据质控过滤 查看质量确定过滤范围 选择quality score 大于20  
  qiime dada2 denoise-paired \
  --i-demultiplexed-seqs ./paired-end-demux.qza \
  --p-trim-left-f 10 \
  --p-trim-left-r 10 \
  --p-trunc-len-f 220 \
  --p-trunc-len-r 220 \
  --o-table ./dada2_table.qza \
  --o-representative-sequences ./dada2_rep_set.qza \
  --o-denoising-stats ./dada2_stats.qza \
  --p-n-threads 0

#可视化化-#质量表，查看质控后的数据质量#特征表统计#代表序列统计
  qiime metadata tabulate \
  --m-input-file ./dada2_stats.qza  \
  --o-visualization ./dada2_stats.qzv
  qiime feature-table summarize \
  --i-table ./dada2_table.qza \
  --m-sample-metadata-file ./metadata-15.txt \
  --o-visualization ./dada2_table.qzv
  qiime feature-table tabulate-seqs \
  --i-data ./dada2_rep_set.qza \
  --o-visualization ./dada2_rep_set.qzv

#导出feature table (含有非细菌ASV)
  qiime tools export \
  --input-path dada2_table.qza \
  --output-path feature_table
  biom convert \
   -i feature_table/feature-table.biom \
   -o feature_table/feature-table.txt --to-tsv

#silva 物种注释 (适合环境样品）
 qiime feature-classifier classify-sklearn   
  --i-classifier silva-138-99-515-806-nb-classifier.qza   
  --i-reads dada2_rep_set.qza   
  --o-classification taxonomy_silva.qza
   -----可视化，查看除bacteria外的
     qiime metadata tabulate \
     --m-input-file taxonomy_silva.qza \
     --o-visualization taxonomy_silva.qzv
#导出物种注释表（非细菌的物种也在）
  qiime tools export \
  --input-path taxonomy_silva.qza \
  --output-path taxonomy_silva
  biom convert \
   -i taxonomy_silva /feature-table.biom \
   -o taxonomy_silva / taxonomy_silva.txt --to-tsv

#根据物种注释过滤除bacteria外的物种ASV(Archaea,Eukaryota,线粒体、叶绿体)没有删除unassined (后续手动删除)
 qiime taxa filter-table   
 --i-table dada2_table.qza   
 --i-taxonomy taxonomy_silva.qza   
 --p-exclude Archaea,Eukaryota, mitochondria,chloroplast   
 --o-filtered-table table-bacteria.qza
 #过滤序列
qiime taxa filter-seqs \
  --i-sequences dada2_rep_set.qza \
  --i-taxonomy taxonomy_silva.qza \
  --p-exclude Archaea,Eukaryota,mitochondria,chloroplast \
  --o-filtered-sequence seq-bacteria.qza

#输出只有细菌的ASV表table-bacteria.txt
  qiime tools export \ 
  --input-path table-bacteria.qza \  
  --output-path table-bacteria 
  biom convert 
  -i table-bacteria/feature-table.biom 
  -o table-bacteria/table-bacteria.txt --to-tsv

#物种分类柱状图
qiime taxa barplot \
 >   --i-table ./table-bacteria.qza \
>   --i-taxonomy ./taxonomy_silva.qza \
>   --m-metadata-file ./metadata.txt \
>   --o-visualization ./taxa_barplot.qzv

#生成系统进化树phylogeny tree 
qiime phylogeny align-to-tree-mafft-fasttree \
  --i-sequences seq-bacteria.qza \
  --o-alignment aligned-rep-seqs.qza \
  --o-masked-alignment masked-aligned-rep-seqs.qza \
  --o-tree unrooted-tree.qza \
  --o-rooted-tree rooted-tree.qza
#生成.nwk文件 树
qiime tools export \ 
  --input-path rooted-tree.qza \
  --output-path rooted-tree


#lefse(使用已经筛了的表，但是usignned没有删除),导出lefse-level6.txt,后根据
#按属进行合并，统计各属总reads
qiime taxa collapse \
 --i-table table-bacteria.qza \
 --i-taxonomy taxonomy_silva.qza \
 --p-level 6 \
 --o-collapsed-table lefse-level6.qza
qiime tools export \
  --input-path lefse-level6.qza \
  --output-path lefse-level6
  biom convert \
-i lefse-level6/feature-table.biom \
-o lefse-level6/lefse-level6.txt --to-tsv


qiime2_fungus
D:\测序
feature-table.txt	dada2后的原始ASV表
feature-bacteria.txt	根据物种注释，删除非细菌（古菌）等后的ASV表
taxonomy_unite.qza	
	
	


title：qiime2——fungus
YUJING 2023.8.4
/CUE-diversity/Fungus

source ~/.bashrc
conda activate qiime2-2022.11
unzip -q fungus.zip

#导入双端数据，生成 .qza
  qiime tools import \
  --type "SampleData[PairedEndSequencesWithQuality]" \
  --input-path ./manifest.txt \
  --output-path ./paired-end-demux.qza \
  --input-format PairedEndFastqManifestPhred33V2

#可视化 .qza变为.qzv 检查样品序列和测序深度
  qiime demux summarize \
  --i-data ./paired-end-demux.qza \
  --o-visualization ./paired-end-demux.qzv

#数据质控过滤 查看质量确定过滤范围 选择quality score 大于20  
  qiime dada2 denoise-paired \
  --i-demultiplexed-seqs ./paired-end-demux.qza \
  --p-trim-left-f 10 \
  --p-trim-left-r 10 \
  --p-trunc-len-f 220 \
  --p-trunc-len-r 220 \
  --o-table ./dada2_table.qza \
  --o-representative-sequences ./dada2_rep_set.qza \
  --o-denoising-stats ./dada2_stats.qza \
  --p-n-threads 0

#可视化化-#质量表，查看质控后的数据质量#特征表统计#代表序列统计
  qiime metadata tabulate \
  --m-input-file ./dada2_stats.qza  \
  --o-visualization ./dada2_stats.qzv
  qiime feature-table summarize \
  --i-table ./dada2_table.qza \
  --m-sample-metadata-file ./metadata.txt \
  --o-visualization ./dada2_table.qzv
  qiime feature-table tabulate-seqs \
  --i-data ./dada2_rep_set.qza \
  --o-visualization ./dada2_rep_set.qzv
  

#导出feature table (含有非真菌ASV)
  qiime tools export \
  --input-path dada2_table.qza \
  --output-path feature_table
  biom convert \
   -i feature_table/feature-table.biom \
   -o feature_table/feature-table.txt --to-tsv


#unite真菌物种注释 https://unite.ut.ee/repository.php
 #训练分类器【training-feature-classfiier】
  qiime tools import \
  --type 'FeatureData[Sequence]' \
  --input-path sh_refs_qiime_ver9_99_25.07.2023_dev.fasta \
  --output-path 99_otus.qza

  qiime tools import \
  --type 'FeatureData[Taxonomy]' \
  --input-format HeaderlessTSVTaxonomyFormat \
  --input-path sh_taxonomy_qiime_ver9_99_25.07.2023_dev.txt \
  --output-path ref-taxonomy.qza

  qiime feature-classifier fit-classifier-naive-bayes \
  --i-reference-reads 99_otus.qza \
  --i-reference-taxonomy ref-taxonomy.qza \
  --o-classifier classifier.qza

  qiime feature-classifier classify-sklearn \
  --i-classifier classifier.qza \
  --i-reads dada2_rep_set.qza \
  --o-classification taxonomy_unite.qza
  ---可视化,查看除fungu之外的，看看要删除啥
  qiime metadata tabulate \
  --m-input-file taxonomy_unite.qza \
  --o-visualization taxonomy_unite.qzv

#根据物种注释过滤除fungus外的物种ASV(叶绿体、线粒体)
qiime taxa filter-table \
 --i-table dada2_table.qza \
 --i-taxonomy taxonomy_unite.qza \
 --p-exclude mitochondria,chloroplast \
 --o-filtered-table table_fungus.qza
#过滤序列
qiime taxa filter-seqs \
  --i-sequences dada2_rep_set.qza \
  --i-taxonomy taxonomy_unite.qza \
  --p-exclude mitochondria,chloroplast \
  --o-filtered-sequence seq-fungus.qza


#输出只有真菌的ASV表table_fungus.txt
  qiime tools export \
  --input-path table_fungus.qza \
  --output-path table_fungus
  biom convert 
  -i table_fungus /feature-table.biom 
  -o table_fungus/table_fungus.txt --to-tsv

#物种分类柱状图
qiime taxa barplot \
 >   --i-table ./table-bacteria.qza \
>   --i-taxonomy ./taxonomy_silva.qza \
>   --m-metadata-file ./metadata.txt \
>   --o-visualization ./taxa_barplot.qzv


#生成系统进化树phylogeny tree 
qiime phylogeny align-to-tree-mafft-fasttree \
  --i-sequences seq-fungus.qza \
  --o-alignment aligned-rep-seqs.qza \
  --o-masked-alignment masked-aligned-rep-seqs.qza \
  --o-tree unrooted-tree.qza \
  --o-rooted-tree rooted-tree.qza
#生成.nwk文件 树
qiime tools export \ 
  --input-path rooted-tree.qza \
  --output-path rooted-tree



