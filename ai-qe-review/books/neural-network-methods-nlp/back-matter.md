# 后置内容

> [!cite] 此文件保留最后一个自动识别章节之后的附录、书目、索引或未自动归类内容。来源：[reading.md](../../../transcripts/mineru/neural-network-methods-nlp/reading.md)，源行 4784–5512。


## 21.1 WHAT HAVE WE SEEN?

The introduction of neural networks methods has been transformative for NLP. It prompted a move from linear-models with heavy feature engineering (and in particular the engineering of backoff and combination features) to multi-layer perceptrons that learn the feature combinations (as discussed in the first part of the book); to architectures like convolutional neural networks that can identify generalizable ngrams and gappy-ngrams (as discussed in Chapter 13); to architectures like RNNs and bidirectional RNNs (Chapters 14–16) that can identify subtle patterns and regularities in sequences of arbitrary lengths; and to recursive neural networks (Chapter 18) that can represent trees. They also brought about methods for encoding words as vectors based on distributional similarity, which can be effective for semi-supervised learning (Chapters 10–11); and methods for non-markovian language modeling, which in turn pave the way to flexible conditioned language generation models (Chapter 17), and revolutionized machine translation. The neural methods also present many opportunities for multi-task learning (Chapter 20). Moreover, established pre-neural structured-prediction techniques can be readily adapted to incorporate neural network based feature extractors and predictors (Chapter 19).

## 21.2 THE CHALLENGES AHEAD

All in all, the field is progressing very quickly, and it is hard to predict what the future will hold. One thing is clear though, at least in my view—with all their impressive advantages, neural networks are not a silver bullet for natural-language understanding and generation. While they provide many improvements over the previous generation of statistical NLP techniques, the core challenges remain: language is discrete and ambiguous, we do not have a good understanding of how it works, and it is not likely that a neural network will learn all the subtleties on its own without careful human guidance. The challenges mentioned in the introduction are ever-present also with the neural techniques, and familiarity with the linguistic concepts and resources presented in Chapter 6 is still as important as ever for designing good language processing systems. The actual performance on many natural language tasks, even low-level and seemingly simple ones such as pronominal coreference resolution [Clark and Manning, 2016, Wiseman et al., 2016] or coordination boundary disambiguation [Ficler and Goldberg, 2016] is still very far from being perfect. Designing learning systems to target such low-level language understanding tasks is as important a research challenge as it was before the introduction of neural NLP methods.

## 252 21. CONCLUSION

Another important challenge is the opaqueness of the learned representations, and the lack of rigorous theory behind the architectures and the learning algorithms. Research into the interpretability of neural network representations, as well as into better understanding of the learning capacity and training dynamics of various architectures, is crucially needed in order to progress even further.

As of the time of this writing, neural networks are in essence still supervised learning methods, and require relatively large amounts of labeled training data. While the use of pre-trained word-embeddings provides a convenient platform for semi-supervised learning, we are still in very preliminary stages of effectively utilizing unlabeled data and reducing the reliance on annotated examples. Remember that humans can often generalize from a handful of examples, while neural networks usually require at least hundreds of labeled examples in order to perform well, even in the most simple language tasks. Finding effective ways of leveraging small amounts of labeled data together with large amounts of un-annotated data, as well as generalizing across domains, will likely result in another transformation of the field.

Finally, an aspect which was only very briefly glossed over in this book is that language is not an isolated phenomena. When people learn, perceive, and produce language, they do it with a reference to the real world, and language utterances are more often than not grounded in real world entities or experiences. Learning language in a grounded setting, either coupled with some other modality such as images, videos, or robot movement control, or as part of an agent that interacts with the world in order to achieve concrete goals, is another promising research frontier.

## Bibliography

Martín Abadi, Ashish Agarwal, Paul Barham, Eugene Brevdo, Zhifeng Chen, Craig Citro, Greg S. Corrado, Andy Davis, Jeffrey Dean, Matthieu Devin, et al. TensorFlow: Large-scale machine learning on heterogeneous systems, 2015. http://tensorflow.org/

Heike Adel, Ngoc Thang Vu, and Tanja Schultz. Combination of recurrent neural networks and factored language models for code-switching language modeling. In Proc. of the 51st Annual Meeting of the Association for Computational Linguistics—(Volume 2: Short Papers), pages 206–211, Sofia, Bulgaria, August 2013.

Roee Aharoni, Yoav Goldberg, and Yonatan Belinkov. Proc. of the 14th SIGMORPHON Workshop on Computational Research in Phonetics, Phonology, and Morphology, chapter improving sequence to sequence learning for morphological inflection generation: The BIU-MIT systems for the SIGMORPHON 2016 shared task for morphological reinflection, pages 41–48. Association for Computational Linguistics, 2016. http://actweb.org/anthology/W16-2007 DOI: 10.18653/v1/W16-2007.

Roee Aharoni and Yoav Goldberg. Towards string-to-tree neural machine translation. Proc. of ACL, 2017.

M. A. Aizerman, E. A. Braverman, and L. Rozonoer. Theoretical foundations of the potential function method in pattern recognition learning. In Automation and Remote Control, number 25 in Automation and Remote Control, pages 821–837, 1964.

Erin L. Allwein, Robert E. Schapire, and Yoram Singer. Reducing multiclass to binary: A unifying approach for margin classifiers. Journal of Machine Learning Research, 1:113–141, 2000.

Rie Ando and Tong Zhang. A high-performance semi-supervised learning method for text chunking. In Proc. of the 43rd Annual Meeting of the Association for Computational Linguistics (ACL'05), pages 1–9, Ann Arbor, Michigan, June 2005a. DOI: 10.3115/1219840.1219841.

Rie Kubota Ando and Tong Zhang. A framework for learning predictive structures from multiple tasks and unlabeled data. The Journal of Machine Learning Research, 6:1817–1853, 2005b.

Daniel Andor, Chris Alberti, David Weiss, Aliaksei Severyn, Alessandro Presta, Kuzman Ganchev, Slav Petrov, and Michael Collins. Globally normalized transition-based neural networks. In Proc. of the 54th Annual Meeting of the Association for Computational Linguistics—(Volume 1: Long Papers), pages 2442–2452, 2016. http://aclweb.org/anthology/P16-1231 DOI: 10.18653/v1/P16-1231.

## 254 BIBLIOGRAPHY

Michael Auli and Jianfeng Gao. Decoder integration and expected BLEU training for recurrent neural network language models. In Proc. of the 52nd Annual Meeting of the Association for Computational Linguistics—(Volume 2: Short Papers), pages 136–142, Baltimore, Maryland, June 2014. DOI: 10.3115/v1/p14-2023.

Michael Auli, Michel Galley, Chris Quirk, and Geoffrey Zweig. Joint language and translation modeling with recurrent neural networks. In Proc. of the 2013 Conference on Empirical Methods in Natural Language Processing, pages 1044–1054, Seattle, Washington. Association for Computational Linguistics, October 2013.

Oded Avraham and Yoav Goldberg. The interplay of semantics and morphology in word embeddings. EACL, 2017.

Dzmitry Bahdanau, Kyunghyun Cho, and Yoshua Bengio. Neural machine translation by jointly learning to align and translate. arXiv:1409.0473 [cs, stat], September 2014.

Miguel Ballesteros, Chris Dyer, and Noah A. Smith. Improved transition-based parsing by modeling characters instead of words with LSTMs. In Proc. of the 2015 Conference on Empirical Methods in Natural Language Processing, pages 349–359, Lisbon, Portugal. Association for Computational Linguistics, September 2015. DOI: 10.18653/v1/d15-1041.

Miguel Ballesteros, Yoav Goldberg, Chris Dyer, and Noah A. Smith. Training with exploration improves a greedy stack-LSTM parser, EMNLP 2016. arXiv:1603.03793 [cs], March 2016. DOI: 10.18653/v1/d16-1211.

Mohit Bansal, Kevin Gimpel, and Karen Livescu. Tailoring continuous word representations for dependency parsing. In Proc. of the 52nd Annual Meeting of the Association for Computational Linguistics—(Volume 2: Short Papers), pages 809–815, Baltimore, Maryland, June 2014. DOI: 10.3115/v1/p14-2131.

Marco Baroni and Alessandro Lenci. Distributional memory: A general framework for corpus-based semantics. Computational Linguistics, 36(4):673–721, 2010. DOI: 10.1162/coli\_a\_00016.

Atilim Gunes Baydin, Barak A. Pearlmutter, Alexey Andreyevich Radul, and Jeffrey Mark Siskind. Automatic differentiation in machine learning: A survey. arXiv:1502.05767 [cs], February 2015.

Emily M. Bender. Linguistic Fundamentals for Natural Language Processing: 100 Essentials from Morphology and Syntax. Synthesis Lectures on Human Language Technologies. Morgan & Claypool Publishers, 2013.

Samy Bengio, Oriol Vinyals, Navdeep Jaitly, and Noam Shazeer. Scheduled sampling for sequence prediction with recurrent neural networks. CoRR, abs/1506.03099, 2015. http://arxiv.org/abs/1506.03099

Yoshua Bengio. Practical recommendations for gradient-based training of deep architectures. arXiv:1206.5533 [cs], June 2012. DOI: 10.1007/978-3-642-35289-8-26.

Yoshua Bengio, Réjean Ducharme, Pascal Vincent, and Christian Janvin. A neural probabilistic language model. Journal of Machine Learning Research, 3:1137–1155, March 2003. ISSN 1532-4435. DOI: 10.1007/10985687\_6.

Yoshua Bengio, Jérôme Louradour, Ronan Collobert, and Jason Weston. Curriculum learning. In Proc. of the 26th Annual International Conference on Machine Learning, pages 41–48. ACM, 2009. DOI: 10.1145/1553374.1553380.

Yoshua Bengio, Ian J. Goodfellow, and Aaron Courville. Deep Learning. MIT Press, 2016.

James Bergstra, Olivier Breuleux, Frédéric Bastien, Pascal Lamblin, Razvan Pascanu, Guillaume Desjardins, Joseph Turian, David Warde-Farley, and Yoshua Bengio. Theano: a CPU and GPU math expression compiler. In Proc. of the Python for Scientific Computing Conference (SciPy), June 2010.

Jeff A. Bilmes and Katrin Kirchhoff. Factored language models and generalized parallel backoff. In Companion Volume of the Proc. of HLT-NAACL—Short Papers, 2003. DOI:10.3115/1073483.1073485.

Zsolt Bitvai and Trevor Cohn. Non-linear text regression with a deep convolutional neural network. In Proc. of the 53rd Annual Meeting of the Association for Computational Linguistics and the 7th International Joint Conference on Natural Language Processing—(Volume 2: Short Papers), pages 180–185, Beijing, China, July 2015. DOI: 10.3115/v1/p15-2030.

Tolga Bolukbasi, Kai-Wei Chang, James Y. Zou, Venkatesh Saligrama, and Adam Tauman Kalai. Quantifying and reducing stereotypes in word embeddings. CoRR, abs/1606.06121, 2016. http://arxiv.org/abs/1606.06121

Bernhard E. Boser, Isabelle M. Guyon, and Vladimir N. Vapnik. A training algorithm for optimal margin classifiers. In Proc. of the 5th Annual ACM Workshop on Computational Learning Theory, pages 144–152. ACM Press, 1992. DOI: 10.1145/130385.130401.

Jan A. Botha and Phil Blunsom. Compositional morphology for word representations and language modelling. In Proc. of the 31st International Conference on Machine Learning (ICML), Beijing, China, June 2014.

Léon Bottou. Stochastic gradient descent tricks. In Neural Networks: Tricks of the Trade, pages 421–436. Springer, 2012. DOI: 10.1007/978-3\_642-35289-8\_25.

R. Samuel Bowman, Gabor Angeli, Christopher Potts, and D. Christopher Manning. A large annotated corpus for learning natural language inference. In Proc. of the 2015 Conference on Empirical Methods in Natural Language Processing, pages 632–642. Association for Computational Linguistics, 2015. http://aclweb.org/anthology/D15-1075 DOI: 10.18653/v1/D15-1075.

Peter Brown, Peter deSouza, Robert Mercer, T. Watson, Vincent Della Pietra, and Jenifer Lai. Class-based n-gram models of natural language. Computational Linguistics, 18(4), December 1992. http://aclweb.org/anthology/J92-4003

John A. Bullinaria and Joseph P. Levy. Extracting semantic representations from word co-occurrence statistics: A computational study. Behavior Research Methods, 39(3):510–526, 2007. DOI: 10.3758/bf03193020.

A. Caliskan-Islam, J. J. Bryson, and A. Narayanan. Semantics derived automatically from language corpora necessarily contain human biases. CoRR, abs/1608.07187, 2016.

Rich Caruana. Multitask learning. Machine Learning, 28:41–75, 1997. DOI: 10.1007/978-1-4615-5529-2\_5.

Eugene Charniak and Mark Johnson. Coarse-to-fine n-best parsing and MaxEnt discriminative reranking. In Proc. of the 43rd Annual Meeting of the Association for Computational Linguistics (ACL'05), pages 173–180, Ann Arbor, Michigan, June 2005. DOI: 10.3115/1219840.1219862.

Danqi Chen and Christopher Manning. A fast and accurate dependency parser using neural networks. In Proc. of the 2014 Conference on Empirical Methods in Natural Language Processing (EMNLP), pages 740–750, Doha, Qatar. Association for Computational Linguistics, October 2014. DOI: 10.3115/v1/d14-1082.

Stanley F. Chen and Joshua Goodman. An empirical study of smoothing techniques for language modeling. In 34th Annual Meeting of the Association for Computational Linguistics, 1996. http://aclweb.org/anthology/P96-1041 DOI: 10.1006/csla.1999.0128.

Stanley F. Chen and Joshua Goodman. An empirical study of smoothing techniques for language modeling. Computer Speech and Language, 13(4):359–394, 1999. DOI: 10.1006/c-sla.1999.0128.

Wenlin Chen, David Grangier, and Michael Auli. Strategies for training large vocabulary neural language models. In Proc. of the 54th Annual Meeting of the Association for Computational Linguistics—(Volume 1: Long Papers), pages 1975–1985, 2016. http://aclweb.org/anthology/P16-1186 DOI: 10.18653/v1/P16-1186.

Yubo Chen, Liheng Xu, Kang Liu, Daojian Zeng, and Jun Zhao. Event extraction via dynamic multi-pooling convolutional neural networks. In Proc. of the 53rd Annual Meeting of the Association for Computational Linguistics and the 7th International Joint Conference on Natural Language Processing—(Volume 1: Long Papers), pages 167–176, Beijing, China, July 2015. DOI: 10.3115/v1/p15-1017.

Kyunghyun Cho. Natural language understanding with distributed representation. arXiv:1511.07916 [cs, stat], November 2015.

Kyunghyun Cho, Bart van Merrienboer, Dzmitry Bahdanau, and Yoshua Bengio. On the properties of neural machine translation: Encoder-decoder approaches. In Proc. of SSST-8, 8th Workshop on Syntax, Semantics and Structure in Statistical Translation, pages 103–111, Doha, Qatar. Association for Computational Linguistics, October 2014a. DOI: 10.3115/v1/w14-4012.

Kyunghyun Cho, Bart van Merrienboer, Caglar Gulcehre, Dzmitry Bahdanau, Fethi Bougares, Holger Schwenk, and Yoshua Bengio. Learning phrase representations using RNN encoder-decoder for statistical machine translation. In Proc. of the 2014 Conference on Empirical Methods in Natural Language Processing (EMNLP), pages 1724–1734, Doha, Qatar. Association for Computational Linguistics, October 2014b. DOI: 10.3115/v1/d14-1179.

Do Kook Choe and Eugene Charniak. Parsing as language modeling. In Proc. of the Conference on Empirical Methods in Natural Language Processing, pages 2331–2336, Austin, Texas. Association for Computational Linguistics, November 2016. https://aclweb.org/anthology.1016-1257 DOI: 10.18653/v1/d16-1257.

Grzegorz Chrupala. Normalizing tweets with edit scripts and recurrent neural embeddings. In Proc. of the 52nd Annual Meeting of the Association for Computational Linguistics—(Volume 2: Short Papers), pages 680–686, Baltimore, Maryland, June 2014. DOI: 10.3115/v1/p14-2111.

Junyoung Chung, Caglar Gulcehre, KyungHyun Cho, and Yoshua Bengio. Empirical evaluation of gated recurrent neural networks on sequence modeling. arXiv:1412.3555 [cs], December 2014.

Junyoung Chung, Kyunghyun Cho, and Yoshua Bengio. A character-level decoder without explicit segmentation for neural machine translation. In Proc. of the 54th Annual Meeting of the Association for Computational Linguistics—(Volume 1: Long Papers), pages 1693–1703, 2016. http://aclweb.org/anthology/P16-1160 DOI: 10.18653/v1/P16-1160.

Kenneth Ward Church and Patrick Hanks. Word association norms, mutual information, and lexicography. Computational Linguistics, 16(1):22–29, 1990. DOI: 10.3115/981623.981633.

Kevin Clark and Christopher D. Manning. Improving coreference resolution by learning entity-level distributed representations. In Association for Computational Linguistics (ACL), 2016. n, apache/hdocs-static pubs/clark2016improving.pdf DOI: 10.18653/v1/p16-1061.

Michael Collins. Discriminative training methods for hidden Markov models: Theory and experiments with perceptron algorithms. In Proc. of the Conference on Empirical Methods in Natural Language Processing, pages 1–8. Association for Computational Linguistics, July 2002. DOI: 10.3115/1118693.1118694.

Michael Collins and Terry Koo. Discriminative reranking for natural language parsing. Computational Linguistics, 31(1):25–70, March 2005. ISSN 0891-2017. DOI: 10.1162/0891201053630273.

Ronan Collobert and Jason Weston. A unified architecture for natural language processing: Deep neural networks with multitask learning. In Proc. of the 25th International Conference on Machine Learning, pages 160–167. ACM, 2008. DOI: 10.1145/1390156.1390177.

Ronan Collobert, Jason Weston, Léon Bottou, Michael Karlen, Koray Kavukcuoglu, and Pavel Kuksa. Natural language processing (almost) from scratch. The Journal of Machine Learning Research, 12:2493–2537, 2011.

Alexis Conneau, Holger Schwenk, Loïc Barrault, and Yann LeCun. Very deep convolutional networks for natural language processing. CoRR, abs/1606.01781, 2016. http://arxiv.org/abs/1606.01781

Ryan Cotterell and Hinrich Schutze. Morphological word embeddings. NAACL, 2015.

Ryan Cotterell, Christo Kirov, John Sylak-Glassman, David Yarowsky, Jason Eisner, and Mans Hulden. Proc. of the 14th SIGMORPHON Workshop on Computational Research in Phonetics, Phonology, and Morphology, chapter The SIGMORPHON 2016 Shared Task—Morphological Reinflection, pages 10–22. Association for Computational Linguistics, 2016. http://aclweb.org/anthology/W16-2002 DOI: 10.18653/v1/W16-2002.

Koby Crammer and Yoram Singer. On the algorithmic implementation of multiclass kernel-based vector machines. The Journal of Machine Learning Research, 2:265–292, 2002.

Mathias Creutz and Krista Lagus. Unsupervised models for morpheme segmentation and morphology learning. ACM Transactions of Speech and Language Processing, 4(1):3:1–3:34, February 2007. ISSN 1550-4875. DOI: 10.1145/1187415.1187418.

James Cross and Liang Huang. Incremental parsing with minimal features using bi-directional LSTM. In Proc. of the 54th Annual Meeting of the Association for Computational Linguistics—(Volume 2: Short Papers), pages 32–37, 2016a. http://aclweb.org, anthology.P16-2006 DOI:10.18653/v1/P16-2006.

James Cross and Liang Huang. Span-based constituency parsing with a structure-label system and dynamic oracles. In Proc. of the 2016 Conference on Empirical Methods in Natural Language Processing (EMNLP). Association for Computational Linguistics, 2016b. DOI: 10.18653/v1/d16-1001.

G. Cybenko. Approximation by superpositions of a sigmoidal function. Mathematics of Control, Signals and Systems, 2(4):303–314, December 1989. ISSN 0932-4194, 1435-568X. DOI: 10.1007/BF02551274.

Ido Dagan and Oren Glickman. Probabilistic textual entailment: Generic applied modeling of language variability. In PASCAL Workshop on Learning Methods for Text Understanding and Mining, 2004.

Ido Dagan, Fernando Pereira, and Lillian Lee. Similarity-based estimation of word cooccurrence probabilities. In ACL, 1994. DOI: 10.3115/981732.981770.

Ido Dagan, Oren Glickman, and Bernardo Magnini. The PASCAL recognising textual entailment challenge. In Machine Learning Challenges, Evaluating Predictive Uncertainty, Visual Object Classification and Recognizing Textual Entailment, First PASCAL Machine Learning Challenges Workshop, MLCW, pages 177–190, Southampton, UK, April 11–13, 2005. (revised selected papers). DOI: 10.1007/11736790\_9.

Ido Dagan, Dan Roth, Mark Sammons, and Fabio Massimo Zanzotto. Recognizing Textual Entailment: Models and Applications. Synthesis Lectures on Human Language Technologies. Morgan & Claypool Publishers, 2013. DOI: 10.2200/s00509ed1v01y201305hlt023.

G. E. Dahl, T. N. Sainath, and G. E. Hinton. Improving deep neural networks for LVCSR using rectified linear units and dropout. In 2013 IEEE International Conference on Acoustics, Speech and Signal Processing (ICASSP), pages 8609–8613, May 2013. DOI: 10.1109/I-CASSP.2013.6639346.

Hal Daumé III, John Langford, and Daniel Marcu. Search-based structured prediction. Machine Learning Journal (MLJ), 2009. DOI: 10.1007/s10994-009-5106-x.

Hal Daumé III. A Course In Machine Learning. Self Published, 2015.

Yann N. Dauphin, Razvan Pascanu, Caglar Gulcehre, Kyunghyun Cho, Surya Ganguli, and Yoshua Bengio. Identifying and attacking the saddle point problem in high-dimensional non-convex optimization. In Z. Ghahramani, M. Welling, C. Cortes, N. D. Lawrence, and K. Q. Weinberger, Eds., Advances in Neural Information Processing Systems 27, pages 2933–2941. Curran Associates, Inc., 2014.

Adrià de Gispert, Gonzalo Iglesias, and Bill Byrne. Fast and accurate preordering for SMT using neural networks. In Proc. of the 2015 Conference of the North American Chapter of the Association for Computational Linguistics: Human Language Technologies, pages 1012–1017, Denver, Colorado, 2015. DOI: 10.3115/v1/n15-1105.

Jacob Devlin, Rabih Zbib, Zhongqiang Huang, Thomas Lamar, Richard Schwartz, and John Makhoul. Fast and robust neural network joint models for statistical machine translation. In Proc. of the 52nd Annual Meeting of the Association for Computational Linguistics—(Volume 1: Long Papers), pages 1370–1380, Baltimore, Maryland, June 2014. DOI: 10.3115/v1/p14-1129.

Trinh Do, Thierry Arti, and others. Neural conditional random fields. In International Conference on Artificial Intelligence and Statistics, pages 177–184, 2010.

Pedro Domingos. The Master Algorithm. Basic Books, 2015.

Li Dong, Furu Wei, Chuanqi Tan, Duyu Tang, Ming Zhou, and Ke Xu. Adaptive recursive neural network for target-dependent twitter sentiment classification. In Proc. of the 52nd Annual Meeting of the Association for Computational Linguistics—(Volume 2: Short Papers), pages 49–54, Baltimore, Maryland, June 2014. DOI: 10.3115/v1/p14-2009.

Li Dong, Furu Wei, Ming Zhou, and Ke Xu. Question answering over freebase with multi-column convolutional neural networks. In Proc. of the 53rd Annual Meeting of the Association for Computational Linguistics and the 7th International Joint Conference on Natural Language Processing—(Volume 1: Long Papers), pages 260–269, Beijing, China, July 2015. DOI: 10.3115/v1/p15-1026.

Cicero dos Santos and Maira Gatti. Deep convolutional neural networks for sentiment analysis of short texts. In Proc. of COLING, the 25th International Conference on Computational Linguistics: Technical Papers, pages 69–78, Dublin City University, Dublin, Ireland. Association for Computational Linguistics, August 2014.

Cicero dos Santos and Bianca Zadrozny. Learning character-level representations for part-of-speech tagging. In Proc. of the 31st International Conference on Machine Learning (ICML), pages 1818–1826, 2014.

Cicero dos Santos, Bing Xiang, and Bowen Zhou. Classifying relations by ranking with convolutional neural networks. In Proc. of the 53rd Annual Meeting of the Association for Computational Linguistics and the 7th International Joint Conference on Natural Language Processing—(Volume 1: Long Papers), pages 626–634, Beijing, China, July 2015. DOI: 10.3115/v1/p15-1061.

John Duchi, Elad Hazan, and Yoram Singer. Adaptive subgradient methods for online learning and stochastic optimization. The Journal of Machine Learning Research, 12:2121–2159, 2011.

Kevin Duh, Graham Neubig, Katsuhito Sudoh, and Hajime Tsukada. Adaptation data selection using neural language models: experiments in machine translation. In Proc. of the 51st Annual Meeting of the Association for Computational Linguistics—(Volume 2: Short Papers), pages 678–683, Sofia, Bulgaria, August 2013.

Greg Durrett and Dan Klein. Neural CRF parsing. In Proc. of the 53rd Annual Meeting of the Association for Computational Linguistics and the 7th International Joint Conference on Natural Language Processing—(Volume 1: Long Papers), pages 302–312, Beijing, China, July 2015. DOI: 10.3115/v1/p15-1030.

Chris Dyer, Victor Chahuneau, and A. Noah Smith. A simple, fast, and effective reparameterization of IBM model 2. In Proc. of the 2013 Conference of the North American Chapter of the Association for Computational Linguistics: Human Language Technologies, pages 644–648, 2013. http://aclweb.org/anthology/N13-1073

Chris Dyer, Miguel Ballesteros, Wang Ling, Austin Matthews, and Noah A. Smith. Transition-based dependency parsing with stack long short-term memory. In Proc. of the 53rd Annual Meeting of the Association for Computational Linguistics and the 7th International Joint Conference on Natural Language Processing—(Volume 1: Long Papers), pages 334–343, Beijing, China, July 2015. DOI: 10.3115/v1/p15-1033.

C. Eckart and G. Young. The approximation of one matrix by another of lower rank. Psychometrika, 1:211–218, 1936. DOI: 10.1007/bf02288367.

Jason Eisner and Giorgio Satta. Efficient parsing for bilexical context-free grammars and head automaton grammars. In Proc. of the 37th Annual Meeting of the Association for Computational Linguistics, 1999. http://aclweb.org/anthology/P99-1059 DOI: 10.3115/1034678.1034748.

Jeffrey L. Elman. Finding structure in time. Cognitive Science, 14(2):179–211, March 1990. ISSN 1551-6709. DOI: 10.1207/s15516709cog1402\_1.

Martin B. H. Everaert, Marinus A. C. Huybregts, Noam Chomsky, Robert C. Berwick, and Johan J. Bolhuis. Structures, not strings: Linguistics as part of the cognitive sciences. Trends in Cognitive Sciences, 19(12):729–743, 2015. DOI: 10.1016/j.tics.2015.09.008.

Manaal Faruqui and Chris Dyer. Improving vector space word representations using multilingual correlation. In Proc. of the 14th Conference of the European Chapter of the Association for Computational Linguistics, pages 462–471, Gothenburg, Sweden, April 2014. DOI: 10.3115/v1/e14-1049.

Manaal Faruqui, Jesse Dodge, Kumar Sujay Jauhar, Chris Dyer, Eduard Hovy, and A. Noah Smith. Retrofitting word vectors to semantic lexicons. In Proc. of the 2015 Conference of the North American Chapter of the Association for Computational Linguistics: Human Language Technologies, pages 1606–1615, 2015. http://aclweb.org/anthology/N15-1184 DOI: 10.3115/v1/N15-1184.

Manaal Faruqui, Yulia Tsvetkov, Graham Neubig, and Chris Dyer. Morphological inflection generation using character sequence to sequence learning. In Proc. of the 2016 Conference of the North American Chapter of the Association for Computational Linguistics: Human Language Technologies, pages 634–643, 2016. http://aclweb.org/anthology/N16-1077 DOI:10.18653/v1/N16-1077.

Christiane Fellbaum. WordNet: An Electronic Lexical Database. Bradford Books, 1998.

Jessica Ficler and Yoav Goldberg. A neural network for coordination boundary prediction. In Proc. of the 2016 Conference on Empirical Methods in Natural Language Processing, pages 23–32, Austin, Texas. Association for Computational Linguistics, November 2016. https://aclweb.org/anthology/D16-1003 DOI: 10.18653/v1/d16-1003.

Katja Filippova and Yasemin Altun. Overcoming the lack of parallel data in sentence compression. In Proc. of the 2013 Conference on Empirical Methods in Natural Language Processing, pages 1481–1491. Association for Computational Linguistics, 2013. http://aclweb.org/anthology/D13-1155

Katja Filippova, Enrique Alfonseca, Carlos A. Colmenares, Lukasz Kaiser, and Oriol Vinyals. Sentence compression by deletion with LSTMs. In Proc. of the 2015 Conference on Empirical Methods in Natural Language Processing, pages 360–368, Lisbon, Portugal. Association for Computational Linguistics, September 2015. DOI: 10.18653/v1/d15-1042.

Charles J. Fillmore, Josef Ruppenhofer, and Collin F. Baker. FrameNet and representing the link between semantic and syntactic relations. Language and Linguistics Monographs Series B, pages 19–62, Institute of Linguistics, Academia Sinica, Taipei, 2004.

John R. Firth. A synopsis of linguistic theory 1930–1955. In Studies in Linguistic Analysis, Special volume of the Philological Society, pages 1–32. Firth, John Rupert, Haas William, Halliday, Michael A. K., Oxford, Blackwell Ed., 1957.

John R. Firth. The technique of semantics. Transactions of the Philological Society, 34(1):36–73, 1935. ISSN 1467-968X. DOI: 10.1111/j.1467-968X.1935.tb01254.x.

Mikel L. Forcada and Ramón P. Ñeco. Recursive hetero-associative memories for translation. In Biological and Artificial Computation: From Neuroscience to Technology, pages 453–462. Springer, 1997. DOI: 10.1007/bfb0032504.

Philip Gage. A new algorithm for data compression. C Users Journal, 12(2):23–38, February 1994. ISSN 0898-9788. http://dl.acm.org/citation.cfm?id=177910.177914

Yarin Gal. A theoretically grounded application of dropout in recurrent neural networks. CoRR, abs/1512.05287, December 2015.

Kuzman Ganchev and Mark Dredze. Proc. of the ACL-08: HLT Workshop on Mobile Language Processing, chapter Small Statistical Models by Random Feature Mixing, pages 19–20. Association for Computational Linguistics, 2008. http://aclweb.org/anthology/WOS-0804

Juri Ganitkevitch, Benjamin Van Durme, and Chris Callison-Burch. PPDB: The paraphrase database. In Proc. of the 2013 Conference of the North American Chapter of the Association for Computational Linguistics: Human Language Technologies, pages 758–764, 2013. http://aclweb.org/anthology/N13-1092

Jianfeng Gao, Patrick Pantel, Michael Gamon, Xiaodong He, and Li Deng. Modeling interestingness with deep neural networks. In Proc. of the Conference on Empirical Methods in Natural Language Processing (EMNLP), pages 2–13, Doha, Qatar. Association for Computational Linguistics, October 2014. DOI: 10.3115/v1/d14-1002.

Dan Gillick, Cliff Brunk, Oriol Vinyals, and Amarnag Subramanya. Multilingual language processing from bytes. In Proc. of the Conference of the North American Chapter of the Association for Computational Linguistics: Human Language Technologies, pages 1296–1306, 2016. http://aclweb.org/anthology/N16-1155 DOI: 10.18653/v1/N16-1155.

Jesús Giménez and Lluis Márquez. SVMTool: A general POS tagger generator based on support vector machines. In Proc. of the 4th LREC, Lisbon, Portugal, 2004.

Xavier Glorot and Yoshua Bengio. Understanding the difficulty of training deep feedforward neural networks. In International Conference on Artificial Intelligence and Statistics, pages 249–256, 2010.

Xavier Glorot, Antoine Bordes, and Yoshua Bengio. Deep sparse rectifier neural networks. In International Conference on Artificial Intelligence and Statistics, pages 315–323, 2011.

Yoav Goldberg. A primer on neural network models for natural language processing. Journal of Artificial Intelligence Research, 57:345–420, 2016.

Yoav Goldberg and Michael Elhadad. An efficient algorithm for easy-first non-directional dependency parsing. In Human Language Technologies: The Annual Conference of the North American Chapter of the Association for Computational Linguistics, pages 742–750, Los Angeles, California, June 2010.

Yoav Goldberg and Joakim Nivre. Training deterministic parsers with non-deterministic oracles. Transactions of the Association for Computational Linguistics, 1(0):403–414, October 2013. ISSN 2307-387X.

Yoav Goldberg, Kai Zhao, and Liang Huang. Efficient implementation of beam-search incremental parsers. In Proc. of the 51st Annual Meeting of the Association for Computational Linguistics—(Volume 2: Short Papers), pages 628–633, Sofia, Bulgaria, August 2013.

Christoph Goller and Andreas Küchler. Learning task-dependent distributed representations by backpropagation through structure. In In Proc. of the ICNN-96, pages 347–352. IEEE, 1996.

Hila Gonen and Yoav Goldberg. Semi supervised preposition-sense disambiguation using multilingual data. In Proc. of COLING, the 26th International Conference on Computational Linguistics: Technical Papers, pages 2718–2729, Osaka, Japan, December 2016. The COLING 2016 Organizing Committee. http://aclweb.org/anthology/C16-1256

Joshua Goodman. A bit of progress in language modeling. CoRR, cs.CL/0108005, 2001. http://arxiv.org/abs/cs.CL/0108005 DOI: 10.1006/csla.2001.0174.

Stephan Gouws, Yoshua Bengio, and Greg Corrado. BilBOWA: Fast bilingual distributed representations without word alignments. In Proc. of the 32nd International Conference on Machine Learning, pages 748–756, 2015.

A. Graves. Supervised Sequence Labelling with Recurrent Neural Networks. Ph.D. thesis, Technische Universität München, 2008. DOI: 10.1007/978-3-642-24797-2.

Alex Graves, Greg Wayne, and Ivo Danihelka. Neural turing machines. CoRR, abs/1410.5401, 2014. http://arxiv.org/abs/1410.5401

Edward Grefenstette, Karl Moritz Hermann, Mustafa Suleyman, and Phil Blunsom. Learning to transduce with unbounded memory. In C. Cortes, N. D. Lawrence, D. D. Lee, M. Sugiyama, and R. Garnett, Eds., Advances in Neural Information Processing Systems 28, pages 1828–1836. Curran Associates, Inc., 2015. http://papers.nips.cc/paper-5618-learning-to-transduce-with-unbounded-memory.pdf

Klaus Greff, Rupesh Kumar Srivastava, Jan Koutník, Bas R. Steunebrink, and Jürgen Schmidhuber. LSTM: A search space odyssey. arXiv:1503.04069 [cs], March 2015. DOI: 10.1109/tnnls.2016.2582924.

Michael Gutmann and Aapo Hyvärinen. Noise-contrastive estimation: A new estimation principle for unnormalized statistical models. In International Conference on Artificial Intelligence and Statistics, pages 297–304, 2010.

Zellig Harris. Distributional structure. Word, 10(23):146–162, 1954. DOI: 10.1080/00437956.1954.11659520.

Kazuma Hashimoto, Makoto Miwa, Yoshimasa Tsuruoka, and Takashi Chikayama. Simple customization of recursive neural networks for semantic relation classification. In Proc. of the Conference on Empirical Methods in Natural Language Processing, pages 1372–1376, Seattle, Washington. Association for Computational Linguistics, October 2013.

Kaiming He, Xiangyu Zhang, Shaoqing Ren, and Jian Sun. Delving deep into rectifiers: Surpassing human-level performance on ImageNet classification. arXiv:1502.01852 [cs], February 2015. DOI: 10.1109/iccv.2015.123.

Kaiming He, Xiangyu Zhang, Shaoqing Ren, and Jian Sun. Deep residual learning for image recognition. In The IEEE Conference on Computer Vision and Pattern Recognition (CVPR), June 2016. DOI: 10.1109/cvpr.2016.90.

Matthew Henderson, Blaise Thomson, and Steve Young. Deep neural network approach for the dialog state tracking challenge. In Proc. of the SIGDIAL Conference, pages 467–471, Metz, France. Association for Computational Linguistics, August 2013.

Karl Moritz Hermann and Phil Blunsom. The role of syntax in vector space models of compositional semantics. In Proc. of the 51st Annual Meeting of the Association for Computational Linguistics—(Volume 1: Long Papers), pages 894–904, Sofia, Bulgaria, August 2013.

Karl Moritz Hermann and Phil Blunsom. Multilingual models for compositional distributed semantics. In Proc. of the 52nd Annual Meeting of the Association for Computational Linguistics—(Volume 1: Long Papers), pages 58–68, Baltimore, Maryland, June 2014. DOI: 10.3115/v1/p14-1006.

Salah El Hihi and Yoshua Bengio. Hierarchical recurrent neural networks for long-term dependencies. In D. S. Touretzky, M. C. Mozer, and M. E. Hasselmo, Eds., Advances in Neural Information Processing Systems 8, pages 493–499. MIT Press, 1996.

Felix Hill, Kyunghyun Cho, Sebastien Jean, Coline Devin, and Yoshua Bengio. Embedding word similarity with neural machine translation. arXiv:1412.6448 [cs], December 2014.

Geoffrey E. Hinton, J. L. McClelland, and D. E. Rumelhart. Distributed representations. In D. E. Rumelhart, J. L. McClelland, et al., Eds., Parallel Distributed Processing: Volume 1: Foundations, pages 77–109. MIT Press, Cambridge, 1987.

Geoffrey E. Hinton, Nitish Srivastava, Alex Krizhevsky, Ilya Sutskever, and Ruslan R. Salakhutdinov. Improving neural networks by preventing co-adaptation of feature detectors. arXiv:1207.0580 [cs], July 2012.

Sepp Hochreiter and Jürgen Schmidhuber. Long short-term memory. Neural Computation, 9(8):1735–1780, 1997. DOI: 10.1162/neco.1997.9.8.1735.

Julia Hockenmaier. Data and Models for Statistical Parsing with Combinatory Categorical Grammar. Ph.D. thesis, University of Edinburgh, 2003. DOI: 10.3115/1073083.1073139.

Kurt Hornik, Maxwell Stinchcombe, and Halbert White. Multilayer feedforward networks are universal approximators. Neural Networks, 2(5):359–366, 1989. ISSN 0893-6080. DOI: 10.1016/0893-6080(89)90020-8.

Dirk Hovy, Stephen Tratz, and Eduard Hovy. What's in a preposition? dimensions of sense disambiguation for an interesting word class. In Coling Posters, pages 454–462, Beijing, China, August 2010. Coling 2010 Organizing Committee. http://www.aclweb.org/anthology/C10-2052

(Kenneth) Ting-Hao Huang, Francis Ferraro, Nasrin Mostafazadeh, Ishan Misra, Aishwarya Agrawal, Jacob Devlin, Ross Girshick, Xiaodong He, Pushmeet Kohli, Dhruv Batra, Lawrence C. Zitnick, Devi Parikh, Lucy Vanderwende, Michel Galley, and Margaret Mitchell. Visual storytelling. In Proc. of the 2016 Conference of the North American Chapter of the Association for Computational Linguistics: Human Language Technologies, pages 1233–1239, 2016. http://aclweb.org/anthology/N16-1147 DOI: 10.18653/v1/N16-1147.

Liang Huang, Suphan Fayong, and Yang Guo. Structured perceptron with inexact search. In Proc. of the Conference of the North American Chapter of the Association for Computational Linguistics: Human Language Technologies, pages 142–151, 2012. http://aclweb.org/anthology/N12-1015

Sergey Ioffe and Christian Szegedy. Batch normalization: Accelerating deep network training by reducing internal covariate shift. arXiv:1502.03167 [cs], February 2015.

Ozan Irsoy and Claire Cardie. Opinion mining with deep recurrent neural networks. In Proc. of the 2014 Conference on Empirical Methods in Natural Language Processing (EMNLP), pages 720–728, Doha, Qatar. Association for Computational Linguistics, October 2014. DOI: 10.3115/v1/d14-1080.

Mohit Iyyer, Jordan Boyd-Graber, Leonardo Claudino, Richard Socher, and Hal Daumé III. A neural network for factoid question answering over paragraphs. In Proc. of the Conference on Empirical Methods in Natural Language Processing (EMNLP), pages 633–644, Doha, Qatar. Association for Computational Linguistics, October 2014a. DOI: 10.3115/v1/d14-1070.

Mohit Iyyer, Peter Enns, Jordan Boyd-Graber, and Philip Resnik. Political ideology detection using recursive neural networks. In Proc. of the 52nd Annual Meeting of the Association for Computational Linguistics—(Volume 1: Long Papers), pages 1113–1122, Baltimore, Maryland, June 2014b. DOI: 10.3115/v1/p14-1105.

Mohit Iyyer, Varun Manjunatha, Jordan Boyd-Graber, and Hal Daumé III. Deep unordered composition rivals syntactic methods for text classification. In Proc. of the 53rd Annual Meeting of the Association for Computational Linguistics and the 7th International Joint Conference on Natural Language Processing—(Volume 1: Long Papers), pages 1681–1691, Beijing, China, July 2015. DOI: 10.3115/v1/p15-1162.

Sébastien Jean, Kyunghyun Cho, Roland Memisevic, and Yoshua Bengio. On using very large target vocabulary for neural machine translation. In Proc. of the 53rd Annual Meeting of the Association for Computational Linguistics and the 7th International Joint Conference on Natural Language Processing—(Volume 1: Long Papers), pages 1–10, 2015. http://aclweb.org/anthology/P15-1001 DOI: 10.3115/v1/P15-1001.

Frederick Jelinek and Robert Mercer. Interpolated estimation of Markov source parameters from sparse data. In Workshop on Pattern Recognition in Practice, 1980.

Rie Johnson and Tong Zhang. Effective use of word order for text categorization with convolutional neural networks. In Proc. of the 2015 Conference of the North American Chapter of the Association for Computational Linguistics: Human Language Technologies, pages 103–112, Denver, Colorado, 2015. DOI: 10.3115/v1/n15-1011.

Aravind K. Joshi and Bangalore Srinivas. Disambiguation of super parts of speech (or supertags): Allnost parsing. In COLING Volume 1: The 15th International Conference on Computational Linguistics, 1994. http://aclweb.org/anthology/C94.1024 DOI: 10.3115/991886.991912.

Armand Joulin, Edouard Grave, Piotr Bojanowski, and Tomas Mikolov. Bag of tricks for efficient text classification. CoRR, abs/1607.01759, 2016. http://arxiv.org/abs/1607.01759

Rafal Jozefowicz, Wojciech Zaremba, and Ilya Sutskever. An empirical exploration of recurrent network architectures. In Proc. of the 32nd International Conference on Machine Learning (ICML-15), pages 2342–2350, 2015.

Rafal Jozefowicz, Oriol Vinyals, Mike Schuster, Noam Shazeer, and Yonghui Wu. Exploring the limits of language modeling. arXiv:1602.02410 [cs], February 2016.

Daniel Jurafsky and James H. Martin. Speech and Language Processing, 2nd ed. Prentice Hall, 2008.

Nal Kalchbrenner, Edward Grefenstette, and Phil Blunsom. A convolutional neural network for modelling sentences. In Proc. of the 52nd Annual Meeting of the Association for Computational Linguistics—(Volume 1: Long Papers), pages 655–665, Baltimore, Maryland, June 2014. DOI: 10.3115/v1/p14-1062.

Nal Kalchbrenner, Lasse Espeholt, Karen Simonyan, Aäron van den Oord, Alex Graves, and Koray Kavukcuoglu. Neural machine translation in linear time. CoRR, abs/1610.10099, 2016. http://arxiv.org/abs/1610.10099

Katharina Kann and Hinrich Schütze. Proc. of the 14th SIGMORPHON Workshop on Computational Research in Phonetics, Phonology, and Morphology, chapter MED: The LMU System for the SIGMORPHON 2016 Shared Task on Morphological Reinflection, pages 62–70. Association for Computational Linguistics, 2016. http://aclweb.org/anthology/W16-2010 DOI: 10.18653/v1/W16-2010.

Anjuli Kannan, Karol Kurach, Sujith Ravi, Tobias Kaufmann, Andrew Tomkins, Balint Miklos, Greg Corrado, Laszlo Lukacs, Marina Ganea, Peter Young, and Vivek Ramavajjala. Smart reply: Automated response suggestion for email. In Proc. of the ACM SIGKDD Conference on Knowledge Discovery and Data Mining (KDD), 2016. https://arxiv.org/pdf/1606.04870.pdf DOI: 10.1145/2939672.2939801.

Andrej Karpathy and Fei-Fei Li. Deep visual-semantic alignments for generating image descriptions. In IEEE Conference on Computer Vision and Pattern Recognition, CVPR, pages 3128–3137, Boston, MA, June 7–12, 2015. DOI: 10.1109/cvpr.2015.7298932.

Andrej Karpathy, Justin Johnson, and Fei-Fei Li. Visualizing and understanding recurrent networks. arXiv:1506.02078 [cs], June 2015.

Douwe Kiela and Stephen Clark. A systematic study of semantic vector space model parameters. In Workshop on Continuous Vector Space Models and their Compositionality, 2014. DOI: 10.3115/v1/w14-1503.

Yoon Kim. Convolutional neural networks for sentence classification. In Proc. of the Conference on Empirical Methods in Natural Language Processing (EMNLP), pages 1746–1751, Doha, Qatar. Association for Computational Linguistics, October 2014. DOI: 10.3115/v1/d14-1181.

Yoon Kim, Yacine Jernite, David Sontag, and Alexander M. Rush. Character-aware neural language models. arXiv:1508.06615 [cs, stat], August 2015.

Diederik Kingma and Jimmy Ba. ADAM: A method for stochastic optimization. arXiv:1412.6980 [cs], December 2014.

Eliyahu Kiperwasser and Yoav Goldberg. Easy-first dependency parsing with hierarchical tree LSTMs. Transactions of the Association of Computational Linguistics—(Volume 4, Issue 1), pages 445–461, 2016a. http://aclweb.org/anthology/Q16-1032

Eliyahu Kiperwasser and Yoav Goldberg. Simple and accurate dependency parsing using bidirectional LSTM feature representations. Transactions of the Association of Computational Linguistics—(Volume 4, Issue 1), pages 313–327, 2016b. http://aclweb.org/anthology/Q16-1023

Karin Kipper, Hoa T. Dang, and Martha Palmer. Class-based construction of a verb lexicon. In AAAI/IAAI, pages 691–696, 2000.

Ryan Kiros, Yukun Zhu, Ruslan R Salakhutdinov, Richard Zemel, Raquel Urtasun, Antonio Torralba, and Sanja Fidler. Skip-thought vectors. In C. Cortes, N. D. Lawrence, D. D. Lee, M. Sugiyama, and R. Garnett, Eds., Advances in Neural Information Processing Systems 28, pages 3294–3302. Curran Associates, Inc., 2015. http://papers.mps.cc/paper/5950-skip-thought-vectors.pdf

Sigrid Klerke, Yoav Goldberg, and Anders Søgaard. Improving sentence compression by learning to predict gaze. In Proc. of the Conference of the North American Chapter of the Association for Computational Linguistics: Human Language Technologies, pages 1528–1533, 2016. http://aclweb.org/anthology/N16-1179 DOI: 10.18653/v1/N16-1179.

Reinhard Kneser and Hermann Ney. Improved backing-off for m-gram language modeling. In Acoustics, Speech, and Signal Processing, ICASSP-95, International Conference on, volume 1, pages 181–184, May 1995. DOI: 10.1109/ICASSP.1995.479394.

Philipp Koehn. Europarl: A parallel corpus for statistical machine translation. In Proc. of MT Summit, volume 5, pages 79–86, 2005.

Philipp Koehn. Statistical Machine Translation. Cambridge University Press, 2010. DOI: 10.1017/cbo9780511815829.

Terry Koo and Michael Collins. Efficient third-order dependency parsers. In Proc. of the 48th Annual Meeting of the Association for Computational Linguistics, pages 1–11, 2010. http://aclweb.org/anthology/P10-1001

Moshe Koppel, Jonathan Schler, and Shlomo Argamon. Computational methods in authorship attribution. Journal of the American Society for information Science and Technology, 60(1):9–26, 2009. DOI: 10.1002/asi.20961.

Alex Krizhevsky, Ilya Sutskever, and Geoffrey E. Hinton. ImageNet classification with deep convolutional neural networks. In F. Pereira, C. J. C. Burges, L. Bottou, and K. Q. Weinberger, Eds., Advances in Neural Information Processing Systems 25, pages 1097–1105. Curran Associates, Inc., 2012. DOI: 10.1007/978-3-319-46654-5\_20.

R. A. Kronmal and A. V. Peterson, Jr. On the alias method for generating random variables from a discrete distribution. The American Statistician, 33:214–218, 1979. DOI: 10.2307/2683739.

Sandra Kübler, Ryan McDonald, and Joakim Nivre. Dependency Parsing. Synthesis Lectures on Human Language Technologies. Morgan & Claypool Publishers, 2008. DOI:10.2200/s00169ed1v01y200901hlt002.

Taku Kudo and Yuji Matsumoto. Fast methods for Kernel-based text analysis. In Proc. of the 41st Annual Meeting on Association for Computational Linguistics—(Volume 1), pages 24–31, Stroudsburg, PA, 2003. DOI: 10.3115/1075096.1075100.

John Lafferty, Andrew McCallum, and Fernando CN Pereira. Conditional random fields: Probabilistic models for segmenting and labeling sequence data. In Proc. of ICML, 2001.

Guillaume Lample, Miguel Ballesteros, Sandeep Subramanian, Kazuya Kawakami, and Chris Dyer. Neural architectures for named entity recognition. In Proc. of the Conference of the North American Chapter of the Association for Computational Linguistics: Human Language Technologies, pages 260–270, 2016. http://aclweb.org/anthology/N16-1030 DOI: 10.18653/v1/N16-1030.

Phong Le and Willem Zuidema. The inside-outside recursive neural network model for dependency parsing. In Proc. of the Conference on Empirical Methods in Natural Language Processing (EMNLP), pages 729–739, Doha, Qatar. Association for Computational Linguistics, October 2014. DOI: 10.3115/v1/d14-1081.

Phong Le and Willem Zuidema. The forest convolutional network: Compositional distributional semantics with a neural chart and without binarization. In Proc. of the Conference on Empirical Methods in Natural Language Processing, pages 1155–1164, Lisbon, Portugal. Association for Computational Linguistics, September 2015. DOI: 10.18653/v1/d15-1137.

Quoc V. Le, Navdeep Jaitly, and Geoffrey E. Hinton. A simple way to initialize recurrent networks of rectified linear units. arXiv:1504.00941 [cs], April 2015.

Yann LeCun and Yoshua Bengio. Convolutional networks for images, speech, and time-series. In M. A. Arbib, Ed., The Handbook of Brain Theory and Neural Networks. MIT Press, 1995.

Yann LeCun, Leon Bottou, G. Orr, and K. Muller. Efficient BackProp. In G. Orr and Muller K, Eds., Neural Networks: Tricks of the Trade. Springer, 1998a. DOI: 10.1007/3-540-49430-8-2.

Yann LeCun, Leon Bottou, Yoshua Bengio, and Patrick Haffner. Gradient based learning applied to pattern recognition. Proc. of the IEEE, 86(11):2278–2324, November 1998b.

Yann LeCun and F. Huang. Loss functions for discriminative training of energy-based models. In Proc. of AISTATS, 2005.

Yann LeCun, Sumit Chopra, Raia Hadsell, M. Ranzato, and F. Huang. A tutorial on energy-based learning. Predicting Structured Data, 1:0, 2006.

Geunbae Lee, Margot Flowers, and Michael G. Dyer. Learning distributed representations of conceptual knowledge and their application to script-based story processing. In Connectionist Natural Language Processing, pages 215–247. Springer, 1992. DOI: 10.1007/978-94-0112624-3\_11.

Moshe Leshno, Vladimir Ya. Lin, Allan Pinkus, and Shimon Schocken. Multilayer feedforward networks with a nonpolynomial activation function can approximate any function. Neural Networks, 6(6):861–867, 1993. ISSN 0893-6080. http://www.sciencedirect.com-science/article/pii/S0893608005801315 DOI: 10.1016/S0893-6080(05)80131-5.

Omer Levy and Yoav Goldberg. Dependency-based word embeddings. In Proc. of the 52nd Annual Meeting of the Association for Computational Linguistics—(Volume 2: Short Papers), pages 302–308, Baltimore, Maryland, June 2014. DOI: 10.3115/v1/p14-2050.

Omer Levy and Yoav Goldberg. Linguistic regularities in sparse and explicit word representations. In Proc. of the 18th Conference on Computational Natural Language Learning, pages 171–180.

Association for Computational Linguistics, 2014. http://aclweb.org/anthology/W14-1618 DOI: 10.3115/v1/W14-1618.

Omer Levy and Yoav Goldberg. Neural word embedding as implicit matrix factorization. In Z. Ghahramani, M. Welling, C. Cortes, N. D. Lawrence, and K. Q. Weinberger, Eds., Advances in Neural Information Processing Systems 27, pages 2177–2185. Curran Associates, Inc., 2014.

Omer Levy, Yoav Goldberg, and Ido Dagan. Improving distributional similarity with lessons learned from word embeddings. Transactions of the Association for Computational Linguistics, 3(0):211–225, May 2015. ISSN 2307-387X.

Omer Levy, Anders Søgaard, and Yoav Goldberg. A strong baseline for learning cross-lingual word embeddings from sentence alignments. In Proc. of the 15th Conference of the European Chapter of the Association for Computational Linguistics, 2017.

Mike Lewis and Mark Steedman. Improved CCG parsing with semi-supervised supertagging. Transactions of the Association for Computational Linguistics, 2(0):327–338, October 2014. ISSN 2307-387X.

Mike Lewis, Kenton Lee, and Luke Zettlemoyer. LSTM CCG parsing. In Proc. of the Conference of the North American Chapter of the Association for Computational Linguistics: Human Language Technologies, pages 221–231, 2016. http://aclweb.org/ontology/N16-1026 DOI: 10.18653/v1/N16-1026.

Jiwei Li, Rumeng Li, and Eduard Hovy. Recursive deep models for discourse parsing. In Proc. of the Conference on Empirical Methods in Natural Language Processing (EMNLP), pages 2061–2069, Doha, Qatar. Association for Computational Linguistics, October 2014. DOI: 10.3115/v1/d14-1220.

Jiwei Li, Thang Luong, Dan Jurafsky, and Eduard Hovy. When are tree structures necessary for deep learning of representations? In Proc. of the Conference on Empirical Methods in Natural Language Processing, pages 2304–2314. Association for Computational Linguistics, 2015. http://aclweb.org/anthology/D15-1278 DOI: 10.18653/v1/D15-1278.

Jiwei Li, Michel Galley, Chris Brockett, Georgios Spithourakis, Jianfeng Gao, and Bill Dolan. A persona-based neural conversation model. In Proc. of the 54th Annual Meeting of the Association for Computational Linguistics—(Volume 1: Long Papers), pages 994–1003, 2016. http://aclweb.org/anthology/P16-1094 DOI: 10.18653/v1/P16-1094.

G. J. Lidstone. Note on the general case of the Bayes-Laplace formula for inductive or a posteriori probabilities. Transactions of the Faculty of Actuaries, 8:182–192, 1920.

Wang Ling, Chris Dyer, Alan W. Black, and Isabel Trancoso. Two/too simple adaptations of Word2Vec for syntax problems. In Proc. of the Conference of the North American Chapter of the Association for Computational Linguistics: Human Language Technologies, pages 1299–1304, Denver, Colorado, 2015a. DOI: 10.3115/v1/n15-1142.

Wang Ling, Chris Dyer, Alan W. Black, Isabel Trancoso, Ramon Fernandez, Silvio Amir, Luis Marujo, and Tiago Luis. Finding function in form: Compositional character models for open vocabulary word representation. In Proc. of the Conference on Empirical Methods in Natural Language Processing, pages 1520–1530, Lisbon, Portugal. Association for Computational Linguistics, September 2015b. DOI: 10.18653/v1/d15-1176.

Tal Linzen, Emmanuel Dupoux, and Yoav Goldberg. Assessing the ability of LSTMs to learn syntax-sensitive dependencies. Transactions of the Association for Computational Linguistics, 4:521–535, 2016. ISSN 2307-387X. https://www.transact.org-of-index.php.tacl\_article/view/972

Ken Litkowski and Orin Hargraves. The preposition project. In Proc. of the 2nd ACL-SIGSEM Workshop on the Linguistic Dimensions of Prepositions and Their Use in Computational Linguistics Formalisms and Applications, pages 171–179, 2005.

Ken Litkowski and Orin Hargraves. SemEval-2007 task 06: Word-sense disambiguation of prepositions. In Proc. of the 4th International Workshop on Semantic Evaluations, pages 24–29, 2007. DOI: 10.3115/1621474.1621479.

Yang Liu, Furu Wei, Sujian Li, Heng Ji, Ming Zhou, and Houfeng Wang. A dependency-based neural network for relation classification. In Proc. of the 53rd Annual Meeting of the Association for Computational Linguistics and the 7th International Joint Conference on Natural Language Processing—(Volume 2: Short Papers), pages 285–290, Beijing, China, July 2015. DOI: 10.3115/v1/p15-2047.

Minh-Thang Luong, Hieu Pham, and Christopher D. Manning. Effective approaches to attention-based neural machine translation. arXiv:1508.04025 [cs], August 2015.

Minh-Thang Luong, Quoc V. Le, Ilya Sutskever, Oriol Vinyals, and Lukasz Kaiser. Multi-task sequence to sequence learning. In Proc. of ICLR, 2016.

Ji Ma, Yue Zhang, and Jingbo Zhu. Tagging the web: Building a robust web tagger with neural network. In Proc. of the 52nd Annual Meeting of the Association for Computational Linguistics—(Volume 1: Long Papers), pages 144–154, Baltimore, Maryland, June 2014. DOI: 10.3115/v1/p14-1014.

Mingbo Ma, Liang Huang, Bowen Zhou, and Bing Xiang. Dependency-based convolutional neural networks for sentence embedding. In Proc. of the 53rd Annual Meeting of the Associ-

ation for Computational Linguistics and the 7th International Joint Conference on Natural Language Processing—(Volume 2: Short Papers), pages 174–179, Beijing, China, July 2015. DOI: 10.3115/v1/p15-2029.

Xuezhe Ma and Eduard Hovy. End-to-end sequence labeling via bi-directional LSTM-CNNs-CRF. In Proc. of the 54th Annual Meeting of the Association for Computational Linguistics—(Volume 1: Long Papers), pages 1064–1074, Berlin, Germany, August 2016. http://www.aclweb.org/anthology/P16-1101 DOI: 10.18653/v1/p16-1101.

Christopher Manning and Hinrich Schütze. Foundations of Statistical Natural Language Processing. MIT Press, 1999.

Christopher Manning, Prabhakar Raghavan, and Hinrich Schütze. Introduction to Information Retrieval. Cambridge University Press, 2008. DOI: 10.1017/cho9780511809071.

Junhua Mao, Wei Xu, Yi Yang, Jiang Wang, and Alan L. Yuille. Explain images with multimodal recurrent neural networks. CoRR, abs/1410.1090, 2014. http://arxiv.org/abs/1410.1090

Ryan McDonald, Koby Crammer, and Fernando Pereira. Online large-margin training of dependency parsers. In Proc. of the 43rd Annual Meeting of the Association for Computational Linguistics (ACL'05), pages 91–98, 2005. http://aclweb.org/anthology/P05-1012 DOI: 10.3115/1219840.1219852.

Ryan McDonald, Joakim Nivre, Yvonne Quirmbach-Brundage, Yoav Goldberg, Dipanjan Das, Kuzman Ganchev, Keith B. Hall, Slav Petrov, Hao Zhang, Oscar Täckström, Claudia Bedini, Núria Bertomeu Castelló, and Jungmee Lee. Universal dependency annotation for multilingual parsing. In ACL (2), pages 92–97, 2013.

Tomáš Mikolov. Statistical language models based on neural networks. Ph.D. thesis, Brno University of Technology, 2012.

Tomáš Mikolov. Martin Karafiát, Lukas Burget, Jan Cernocky, and Sanjeev Khudanpur. Recurrent neural network based language model. In INTERSPEECH, 11th Annual Conference of the International Speech Communication Association, pages 1045–1048, Makuhari, Chiba, Japan, September 26–30, 2010.

Tomáš Mikolov, Stefan Kombrink, Lukáš Burget, Jan Honza Černocky, and Sanjeev Khudanpur. Extensions of recurrent neural network language model. In Acoustics, Speech and Signal Processing (ICASSP), IEEE International Conference on, pages 5528–5531, 2011. DOI: 10.1109/i-cassp.2011.5947611.

Tomáš Mikolov. Kai Chen, Greg Corrado, and Jeffrey Dean. Efficient estimation of word representations in vector space. arXiv:1301.3781 [cs], January 2013.

Tomáš Mikolov. Quoc V. Le, and Ilya Sutskever. Exploiting similarities among languages for machine translation. CoRR, abs/1309.4168, 2013. http://arxiv.org/abs/1309.4168

Tomáš Mikolov. Ilya Sutskever, Kai Chen, Greg S Corrado, and Jeff Dean. Distributed representations of words and phrases and their compositionality. In C. J. C. Burges, L. Bottou, M. Welling, Z. Ghahramani, and K. Q. Weinberger, Eds., Advances in Neural Information Processing Systems 26, pages 3111–3119. Curran Associates, Inc., 2013.

Tomáš Mikolov. Wen-tau Yih, and Geoffrey Zweig. Linguistic regularities in continuous space word representations. In Proc. of the Conference of the North American Chapter of the Association for Computational Linguistics: Human Language Technologies, pages 746–751, 2013. http://aclweb.org/anthology/N13-1090

Tomáš Mikolov. Armand Joulin, Sumit Chopra, Michael Mathieu, and Marc'Aurelio Ranzato. Learning longer memory in recurrent neural networks. arXiv:1412.7753 [cs], December 2014.

Scott Miller, Jethran Guinness, and Alex Zamanian. Name tagging with word clusters and discriminative training. In Proc. of the Human Language Technology Conference of the North American Chapter of the Association for Computational Linguistics: HLT-NAACL, 2004. http://aclweb.org/anthology/N04-1043

Andriy Mnih and Koray Kavukcuoglu. Learning word embeddings efficiently with noise-contrastive estimation. In C. J. C. Burges, L. Bottou, M. Welling, Z. Ghahramani, and K. Q. Weinberger, Eds., Advances in Neural Information Processing Systems 26, pages 2265–2273. Curran Associates, Inc., 2013.

Andriy Mnih and Yee Whye Teh. A fast and simple algorithm for training neural probabilistic language models. In John Langford and Joelle Pineau, Eds., Proc. of the 29th International Conference on Machine Learning (ICML-12), pages 1751–1758, New York, NY, July 2012. Omnipress.

Mehryar Mohri, Afshin Rostamizadeh, and Ameet Talwalkar. Foundations of Machine Learning. MIT Press, 2012.

Frederic Morin and Yoshua Bengio. Hierarchical probabilistic neural network language model. In Robert G. Cowell and Zoubin Ghahramani, Eds., Proc. of the 10th International Workshop on Artificial Intelligence and Statistics, pages 246–252, 2005. http://www.iro.unmontreal.ca/lisa/pointeurs/hierarchical-nnlm-aistats05.pdf

Nikola Mrkšić, Diarmuid Ó Séaghdha, Blaise Thomson, Milica Gasic, Pei-Hao Su, David Vandyke, Tsung-Hsien Wen, and Steve Young. Multi-domain dialog state tracking using

recurrent neural networks. In Proc. of the 53rd Annual Meeting of the Association for Computational Linguistics and the 7th International Joint Conference on Natural Language Processing—(Volume 2: Short Papers), pages 794–799, Beijing, China. Association for Computational Linguistics, July 2015. DOI: 10.3115/v1/p15-2130.

Masami Nakamura and Kiyohiro Shikano. A study of English word category prediction based on neural networks. The Journal of the Acoustical Society of America, 84(S1):S60–S61, 1988. DOI: 10.1121/1.2026400.

R. Neidinger. Introduction to automatic differentiation and MATLAB object-oriented programming. SIAM Review, 52(3):545–563, January 2010. ISSN 0036-1445. DOI: 10.1137/080743627.

Y. Nesterov. A method of solving a convex programming problem with convergence rate O (1/k2). In Soviet Mathematics Doklady, 27:372–376, 1983.

Y. Nesterov. Introductory Lectures on Convex Optimization. Kluwer Academic Publishers, 2004. DOI: 10.1007/978-1-4419-8853-9.

Graham Neubig, Chris Dyer, Yoav Goldberg, Austin Matthews, Waleed Ammar, Antonios Anastasopoulos, Miguel Ballesteros, David Chiang, Daniel Clothiaux, Trevor Cohn, Kevin Duh, Manaal Faruqui, Cynthia Gan, Dan Garrette, Yangfeng Ji, Lingpeng Kong, Adhiguna Kuncoro, Gaurav Kumar, Chaitanya Malaviya, Paul Michel, Yusuke Oda, Matthew Richardson, Naomi Saphra, Swabha Swayamdipta, and Pengcheng Yin. DyNet: The dynamic neural network toolkit. CoRR, abs/1701.03980, 2017. http://arxiv.org/abs-1701.03980

Thien Huu Nguyen and Ralph Grishman. Event detection and domain adaptation with convolutional neural networks. In Proc. of the 53rd Annual Meeting of the Association for Computational Linguistics and the 7th International Joint Conference on Natural Language Processing—(Volume 2: Short Papers), pages 365–371, Beijing, China, July 2015. DOI: 10.3115/v1/p15-2060.

Joakim Nivre. Algorithms for deterministic incremental dependency parsing. Computational Linguistics, 34(4):513–553, December 2008. ISSN 0891-2017, 1530-9312. DOI: 10.1162/coli.07-056-R1-07-027.

Joakim Nivre, Željko Agić, Maria Jesus Aranzabe, Masayuki Asahara, Aitziber Atutxa, Miguel Ballesteros, John Bauer, Kepa Bengoetxea, Riyaz Ahmad Bhat, Cristina Bosco, Sam Bowman, Giuseppe G. A. Celano, Miriam Connor, Marie-Catherine de Marneffe, Arantza Diaz de Ilarraza, Kaja Dobrovoljc, Timothy Dozat, Tomaž Erjavec, Richárd Farkas, Jennifer Foster, Daniel Galbraith, Filip Ginter, Iakes Goenaga, Koldo Gojenola, Yoav Goldberg, Berta Gonzales, Bruno Guillaume, Jan Hajič, Dag Haug, Radu Ion, Elena Irimia, Anders Johannsen, Hiroshi Kanayama, Jenna Kanerva, Simon Krek, Veronika Laippala, Alessandro Lenci, Nikola

Ljubešić, Teresa Lynn, Christopher Manning, Cătălina Mărânduc, David Mareček, Héctor Martínez Alonso, Jan Mašek, Yuji Matsumoto, Ryan McDonald, Anna Missilă, Verginica Mititelu, Yusuke Miyao, Simonetta Montemagni, Shunsuke Mori, Hanna Nurmi, Petya Osenova, Lilja ∅vrelid, Elena Pascual, Marco Passarotti, Cenel-Augusto Perez, Slav Petrov, Jussi Piitulainen, Barbara Plank, Martin Popel, Prokopis Prokopidis, Sampo Pyysalo, Loganathan Ramasamy, Rudolf Rosa, Shadi Saleh, Sebastian Schuster, Wolfgang Seeker, Mojgan Seraji, Natalia Silveira, Maria Simi, Radu Simionescu, Katalin Simkó, Kiril Simov, Aaron Smith, Jan Štěpánek, Alane Suhr, Zsolt Szántó, Takaaki Tanaka, Reut Tsarfaty, Sumire Uematsu, Larraitz Uria, Viktor Varga, Veronika Vincze, Zdeněk Žabokrtský, Daniel Zeman, and Hanzhi Zhu. Universal dependencies 1.2, 2015. http://hdl.handle.net/11234/1-1548 LINDAT/CLARIN digital library at Institute of Formal and Applied Linguistics, Charles University in Prague.

Chris Okasaki. Purely Functional Data Structures. Cambridge University Press, Cambridge, UK, June 1999. DOI: 10.1017/cbo9780511530104.

Mitchell P. Marcus, Beatrice Santorini, and Mary Ann Marcinkiewicz. Building a large annotated corpus of English: The Penn Treebank. Computational Linguistics, 19(2), June 1993, Special Issue on Using Large Corpora: II, 1993. http://aclweb.org/anthology/j.93-2004

Martha Palmer, Daniel Gildea, and Nianwen Xue. Semantic Role Labeling. Synthesis Lectures on Human Language Technologies. Morgan & Claypool Publishers, 2010. DOI: 10.1093/oxfordhb/9780199573691.013.023.

Bo Pang and Lillian Lee. Opinion mining and sentiment analysis. Foundation and Trends in Information Retrieval, 2:1–135, 2008. DOI: 10.1561/1500000011.

Ankur P. Parikh, Oscar Täckström, Dipanjan Das, and Jakob Uszkoreit. A decomposable attention model for natural language inference. In Proc. of EMNLP, 2016. DOI: 10.18653/v1/d16-1244.

Razvan Pascanu, Tomas Mikolov, and Yoshua Bengio. On the difficulty of training recurrent neural networks. arXiv:1211.5063 [cs], November 2012.

Ellie Pavlick, Pushpendre Rastogi, Juri Ganitkevitch, Benjamin Van Durme, and Chris Callison-Burch. PPDB 2.0: Better paraphrase ranking, fine-grained entailment relations, word embeddings, and style classification. In Proc. of the 53rd Annual Meeting of the Association for Computational Linguistics and the 7th International Joint Conference on Natural Language Processing—(Volume 2: Short Papers), pages 425–430. Association for Computational Linguistics, 2015. http://aclweb.org/anthology/P15-2070 DOI: 10.3115/v1/P15-2070.

Wenzhe Pei, Tao Ge, and Baobao Chang. An effective neural network model for graph-based dependency parsing. In Proc. of the 53rd Annual Meeting of the Association for Computational Lin-

guistics and the 7th International Joint Conference on Natural Language Processing—(Volume 1: Long Papers), pages 313–322, Beijing, China, July 2015. DOI: 10.3115/v1/p15-1031.

Joris Pelemans, Noam Shazeer, and Ciprian Chelba. Sparse non-negative matrix language modeling. Transactions of the Association of Computational Linguistics, 4(1):329–342, 2016. http://aclweb.org/anthology\_Q16-1021

Jian Peng, Liefeng Bo, and Jinbo Xu. Conditional neural fields. In Y. Bengio, D. Schuurmans, J. D. Lafferty, C. K. I. Williams, and A. Culotta, Eds., Advances in Neural Information Processing Systems 22, pages 1419–1427. Curran Associates, Inc., 2009.

Jeffrey Pennington, Richard Socher, and Christopher Manning. GloVe: global vectors for word representation. In Proc. of the Conference on Empirical Methods in Natural Language Processing (EMNLP), pages 1532–1543, Doha, Qatar. Association for Computational Linguistics, October 2014. DOI: 10.3115/v1/d14-1162.

Vu Pham, Christopher Kermorvant, and Jérôme Louradour. Dropout improves recurrent neural networks for handwriting recognition. CoRR, abs/1312.4569, 2013. http://arxiv.org/abs/1312.4569 DOI: 10.1109/icfhr.2014.55.

Barbara Plank, Anders Søgaard, and Yoav Goldberg. Multilingual part-of-speech tagging with bidirectional long short-term memory models and auxiliary loss. In Proc. of the 54th Annual Meeting of the Association for Computational Linguistics—(Volume 2: Short Papers), pages 412–418. Association for Computational Linguistics, 2016. http://aclweb.org/anthology/P16-2067 DOI: 10.18653/v1/P16-2067.

Jordan B. Pollack. Recursive distributed representations. Artificial Intelligence, 46:77–105, 1990. DOI: 10.1016/0004-3702(90)90005-k.

B. T. Polyak. Some methods of speeding up the convergence of iteration methods. USSR Computational Mathematics and Mathematical Physics, 4(5):1–17, 1964. ISSN 0041-5553. DOI: 10.1016/0041-5553(64)90137-5.

Qiao Qian, Bo Tian, Minlie Huang, Yang Liu, Xuan Zhu, and Xiaoyan Zhu. Learning tag embeddings and tag-specific composition functions in recursive neural network. In Proc. of the 53rd Annual Meeting of the Association for Computational Linguistics and the 7th International Joint Conference on Natural Language Processing—(Volume 1: Long Papers), pages 1365–1374, Beijing, China, July 2015. DOI: 10.3115/v1/p15-1132.

Lev Ratinov and Dan Roth. Proc. of the 13th Conference on Computational Natural Language Learning (CoNLL-2009), chapter Design Challenges and Misconceptions in Named Entity Recognition, pages 147–155. Association for Computational Linguistics, 2009. http://aclweb.org/anthology/W09-1119

Ronald Rosenfeld. A maximum entropy approach to adaptive statistical language modeling. Computer, Speech and Language, 10:187–228, 1996. Longe version: Carnegie Mellon Technical Report CMU-CS-94-138. DOI: 10.1006/csla.1996.0011.

Stéphane Ross and J. Andrew Bagnell. Efficient reductions for imitation learning. In Proc. of the 13th International Conference on Artificial Intelligence and Statistics, pages 661–668, 2010.

Stéphane Ross, Geoffrey J. Gordon, and J. Andrew Bagnell. A reduction of imitation learning and structured prediction to no-regret online learning. In Proc. of the 14th International Conference on Artificial Intelligence and Statistics, pages 627–635, 2011.

David E. Rumelhart, Geoffrey E. Hinton, and Ronald J. Williams. Learning representations by back-propagating errors. Nature, 323(6088):533–536, October 1986. DOI:10.1038/323533a0.

Ivan A. Sag, Thomas Wasow, and Emily M. Bender. Syntactic Theory, 2nd ed., CSLI Lecture Note 152, 2003.

Magnus Sahlgren. The distributional hypothesis. Italian Journal of Linguistics, 20(1):33–54, 2008.

Nathan Schneider, Vivek Srikumar, Jena D. Hwang, and Martha Palmer. A hierarchy with, of, and for preposition supersenses. In Proc. of the 9th Linguistic Annotation Workshop, pages 112–123, 2015. DOI: 10.3115/v1/w15-1612.

Nathan Schneider, Jena D. Hwang, Vivek Srikumar, Meredith Green, Abhijit Suresh, Kathryn Conger, Tim O'Gorman, and Martha Palmer. A corpus of preposition supersenses. In Proc. of the 10th Linguistic Annotation Workshop, 2016. DOI: 10.18653/v1/w16-1712.

Bernhard Schölkopf. The kernel trick for distances. In T. K. Leen, T. G. Dietterich, and V. Tresp, Eds., Advances in Neural Information Processing Systems 13, pages 301–307. MIT Press, 2001. http://papers.nips.cc/paper/1862-the-kernel-trick-for-distances.pdf

M. Schuster and Kuldip K. Paliwal. Bidirectional recurrent neural networks. IEEE Transactions on Signal Processing, 45(11):2673–2681, November 1997. ISSN 1053-587X. DOI: 10.1109/78.650093.

Holger Schwenk, Daniel Dchelotte, and Jean-Luc Gauvain. Continuous space language models for statistical machine translation. In Proc. of the COLING/ACL on Main Conference Poster Sessions, pages 723–730. Association for Computational Linguistics, 2006. DOI: 10.3115/1273073.1273166.

Rico Sennrich and Barry Haddow. Proc. of the 1st Conference on Machine Translation: Volume 1, Research Papers, chapter Linguistic Input Features Improve Neural Machine Translation, pages 83–91. Association for Computational Linguistics, 2016. http://aclweb.org/anthology/W16-2209 DOI: 10.18653/v1/W16-2209.

Rico Sennrich, Barry Haddow, and Alexandra Birch. Neural machine translation of rare words with subword units. In Proc. of the 54th Annual Meeting of the Association for Computational Linguistics—(Volume 1: Long Papers), pages 1715–1725, 2016a. http://aclweb.org/anthology/P16-1162 DOI: 10.18653/v1/P16-1162.

Rico Sennrich, Barry Haddow, and Alexandra Birch. Improving neural machine translation models with monolingual data. In Proc. of the 54th Annual Meeting of the Association for Computational Linguistics—(Volume 1: Long Papers), pages 86–96. Association for Computational Linguistics, 2016b. http://aclweb.org/anthology/P16-1009 DOI: 10.18653/v1/P16-1009.

Shai Shalev-Shwartz and Shai Ben-David. Understanding Machine Learning: From Theory to Algorithms. Cambridge University Press, 2014. DOI: 10.1017/cbo9781107298019.

John Shawe-Taylor and Nello Cristianini. Kernel Methods for Pattern Analysis. Cambridge University Press, Cambridge, UK, June 2004. DOI: 10.4018/9781599040424.ch001.

Q. Shi, J. Petterson, G. Dror, J. Langford, A. J. Smola, A. Strehl, and V. Vishwanathan. Hash kernels. In Artificial Intelligence and Statistics AISTATS'09, Florida, April 2009.

Karen Simonyan and Andrew Zisserman. Very deep convolutional networks for large-scale image recognition. In ICLR, 2015.

Noah A. Smith. Linguistic Structure Prediction. Synthesis Lectures on Human Language Technologies. Morgan & Claypool, May 2011. DOI: 10.2200/s00361ed1v01y201105hlt013.

Richard Socher. Recursive Deep Learning For Natural Language Processing and Computer Vision. Ph.D. thesis, Stanford University, August 2014.

Richard Socher, Christopher Manning, and Andrew Ng. Learning continuous phrase representations and syntactic parsing with recursive neural networks. In Proc. of the Deep Learning and Unsupervised Feature Learning Workshop of {NIPS}, pages 1–9, 2010.

Richard Socher, Cliff Chiung-Yu Lin, Andrew Y. Ng, and Christopher D. Manning. Parsing natural scenes and natural language with recursive neural networks. In Lise Getoor and Tobias Scheffer, Eds., Proc. of the 28th International Conference on Machine Learning, ICML, pages 129–136, Bellevue, Washington, June 28–July 2, Omnipress, 2011.

Richard Socher, Brody Huval, Christopher D. Manning, and Andrew Y. Ng. Semantic compositionality through recursive matrix-vector spaces. In Proc. of the Joint Conference on Empirical Methods in Natural Language Processing and Computational Natural Language Learning, pages 1201–1211, Jeju Island, Korea. Association for Computational Linguistics, July 2012.

Richard Socher, John Bauer, Christopher D. Manning, and Andrew Y. Ng. Parsing with compositional vector grammars. In Proc. of the 51st Annual Meeting of the Association for Computational Linguistics—(Volume 1: Long Papers), pages 455–465, Sofia, Bulgaria, August 2013a.

Richard Socher, Alex Perelygin, Jean Wu, Jason Chuang, Christopher D. Manning, Andrew Ng, and Christopher Potts. Recursive deep models for semantic compositionality over a sentiment treebank. In Proc. of the 2013 Conference on Empirical Methods in Natural Language Processing, pages 1631–1642, Seattle, Washington. Association for Computational Linguistics, October 2013b.

Anders Søgaard. Semi-Supervised Learning and Domain Adaptation in Natural Language Processing. Synthesis Lectures on Human Language Technologies. Morgan & Claypool Publishers, 2013. DOI: 10.2200/s00497ed1v01y201304hlt021.

Anders Søgaard and Yoav Goldberg. Deep multi-task learning with low level tasks supervised at lower layers. In Proc. of the 54th Annual Meeting of the Association for Computational Linguistics—(Volume 2: Short Papers), pages 231–235, 2016. http://actweb.org/anthology/P16-2038 DOI: 10.18653/v1/P16-2038.

Alessandro Sordoni, Michel Galley, Michael Auli, Chris Brockett, Yangfeng Ji, Margaret Mitchell, Jian-Yun Nie, Jianfeng Gao, and Bill Dolan. A neural network approach to context-sensitive generation of conversational responses. In Proc. of the Conference of the North American Chapter of the Association for Computational Linguistics: Human Language Technologies, pages 196–205, Denver, Colorado, 2015. DOI: 10.3115/v1/n15-1020.

Vivek Srikumar and Dan Roth. An inventory of preposition relations. arXiv:1305.5785, 2013a.

Nitish Srivastava, Geoffrey Hinton, Alex Krizhevsky, Ilya Sutskever, and Ruslan Salakhutdinov. Dropout: A simple way to prevent neural networks from overfitting. Journal of Machine Learning Research, 15:1929–1958, 2014. http://jmir.org/papers/v15/srivastava14a.html

E. Strubell, P. Verga, D. Belanger, and A. McCallum. Fast and accurate sequence labeling with iterated dilated convolutions. ArXiv e-prints, February 2017.

Martin Sundermeyer, Ralf Schlüter, and Hermann Ney. LSTM neural networks for language modeling. In INTERSPEECH, 2012.

Martin Sundermeyer, Tamer Alkhouli, Joern Wuebker, and Hermann Ney. Translation modeling with bidirectional recurrent neural networks. In Proc. of the Conference on Empirical Methods in Natural Language Processing (EMNLP), pages 14–25, Doha, Qatar. Association for Computational Linguistics, October 2014. DOI: 10.3115/v1/d14-1003.

Ilya Sutskever, James Martens, and Geoffrey E. Hinton. Generating text with recurrent neural networks. In Proc. of the 28th International Conference on Machine Learning (ICML-11), pages 1017–1024, 2011. DOI: 10.1109/icnn.1993.298658.

Ilya Sutskever, James Martens, George Dahl, and Geoffrey Hinton. On the importance of initialization and momentum in deep learning. In Proc. of the 30th International Conference on Machine Learning (ICML-13), pages 1139–1147, 2013.

Ilya Sutskever, Oriol Vinyals, and Quoc V. V Le. Sequence to sequence learning with neural networks. In Z. Ghahramani, M. Welling, C. Cortes, N. D. Lawrence, and K. Q. Weinberger, Eds., Advances in Neural Information Processing Systems 27, pages 3104–3112. Curran Associates, Inc., 2014.

Kai Sheng Tai, Richard Socher, and Christopher D. Manning. Improved semantic representations from tree-structured long short-term memory networks. In Proc. of the 53rd Annual Meeting of the Association for Computational Linguistics and the 7th International Joint Conference on Natural Language Processing—(Volume 1: Long Papers), pages 1556–1566, Beijing, China, July 2015. DOI: 10.3115/v1/p15-1150.

Akihiro Tamura, Taro Watanabe, and Eiichiro Sumita. Recurrent neural networks for word alignment model. In Proc. of the 52nd Annual Meeting of the Association for Computational Linguistics—(Volume 1: Long Papers), pages 1470–1480, Baltimore, Maryland, June 2014. DOI: 10.3115/v1/p14-1138.

Duyu Tang, Bing Qin, and Ting Liu. Document modeling with gated recurrent neural network for sentiment classification. In Proc. of the Conference on Empirical Methods in Natural Language Processing, pages 1422–1432. Association for Computational Linguistics, 2015. http://aclweb.org/anthology/D15-1167 DOI: 10.18653/v1/D15-1167.

Matus Telgarsky. Benefits of depth in neural networks. arXiv:1602.04485 [cs, stat], February 2016.

Robert Tibshirani. Regression shrinkage and selection via the lasso. Journal of the Royal Statistical Society, Series B, 58:267–288, 1994. DOI: 10.1111/j.1467-9868.2011.00771.x.

T. Tieleman and G. Hinton. Lecture 6.5—RmsProp: Divide the gradient by a running average of its recent magnitude. COURSERA: Neural Networks for Machine Learning, 2012.

Joseph Turian, Lev-Arie Ratinov, and Yoshua Bengio. Word representations: A simple and general method for semi-supervised learning. In Proc. of the 48th Annual Meeting of the Association for Computational Linguistics, pages 384–394, 2010. http://aclweb.org/anthology/P10.1040

Peter D. Turney. Mining the web for synonyms: PMI-IR vs. LSA on TOEFL. In ECML, 2001. DOI: 10.1007/3-540-44795-4\_42.

Peter D. Turney and Patrick Pantel. From frequency to meaning: Vector space models of semantics. Journal of Artificial Intelligence Research, 37(1):141–188, 2010.

Jakob Uszkoreit, Jay Ponte, Ashok Popat, and Moshe Dubiner. Large scale parallel document mining for machine translation. In Proc. of the 23rd International Conference on Computational Linguistics (Coling 2010), pages 1101–1109, Organizing Committee, 2010. http://aclweb.org/anthology/C10-1124

Tim Van de Cruys. A neural network approach to selectional preference acquisition. In Proc. of the Conference on Empirical Methods in Natural Language Processing (EMNLP), pages 26–35, Doha, Qatar. Association for Computational Linguistics, October 2014. DOI: 10.3115/v1/d14-1004.

Ashish Vaswani, Yinggong Zhao, Victoria Fossum, and David Chiang. Decoding with large-scale neural language models improves translation. In Proc. of the Conference on Empirical Methods in Natural Language Processing, pages 1387–1392, Seattle, Washington. Association for Computational Linguistics, October 2013.

Ashish Vaswani, Yinggong Zhao, Victoria Fossum, and David Chiang. Decoding with large-scale neural language models improves translation. In Proc. of the Conference on Empirical Methods in Natural Language Processing, pages 1387–1392. Association for Computational Linguistics, 2013. http://aclweb.org/anthology/D13-1140

Ashish Vaswani, Yonatan Bisk, Kenji Sagae, and Ryan Musa. Supertagging with LSTMs. In Proc. of the Conference of the North American Chapter of the Association for Computational Linguistics: Human Language Technologies, pages 232–237. Association for Computational Linguistics, 2016. http://aclweb.org/anthology/N16-1027 DOI: 10.18653/v1/N16-1027.

Oriol Vinyals, Lukasz Kaiser, Terry Koo, Slav Petrov, Ilya Sutskever, and Geoffrey Hinton. Grammar as a foreign language. arXiv:1412.7449 [cs, stat], December 2014.

Oriol Vinyals, Alexander Toshev, Samy Bengio, and Dumitru Erhan. Show and tell: A neural image caption generator. In IEEE Conference on Computer Vision and Pattern Recognition, CVPR, pages 3156–3164, Boston, MA, June 7–12, 2015. DOI: 10.1109/cvpr.2015.7298935.

Stefan Wager, Sida Wang, and Percy S Liang. Dropout training as adaptive regularization. In C. J. C. Burges, L. Bottou, M. Welling, Z. Ghahramani, and K. Q. Weinberger, Eds., Advances in Neural Information Processing Systems 26, pages 351–359. Curran Associates, Inc., 2013.

Mengqiu Wang and Christopher D. Manning. Effect of non-linear deep architecture in sequence labeling. In IJCNLP, pages 1285–1291, 2013.

Peng Wang, Jiaming Xu, Bo Xu, Chenglin Liu, Heng Zhang, Fangyuan Wang, and Hongwei Hao. Semantic clustering and convolutional neural network for short text categorization. In Proc. of the 53rd Annual Meeting of the Association for Computational Linguistics and the 7th International Joint Conference on Natural Language Processing—(Volume 2: Short Papers), pages 352–357, Beijing, China, July 2015a. DOI: 10.3115/v1/p15-2058.

Xin Wang, Yuanchao Liu, Chengjie Sun, Baoxun Wang, and Xiaolong Wang. Predicting polarities of tweets by composing word embeddings with long short-term memory. In Proc. of the 53rd Annual Meeting of the Association for Computational Linguistics and the 7th International

Joint Conference on Natural Language Processing—(Volume 1: Long Papers), pages 1343–1353, Beijing, China, July 2015b. DOI: 10.3115/v1/p15-1130.

Taro Watanabe and Eiichiro Sumita. Transition-based neural constituent parsing. In Proc. of the 53rd Annual Meeting of the Association for Computational Linguistics and the 7th International Joint Conference on Natural Language Processing—(Volume 1: Long Papers), pages 1169–1179, Beijing, China, July 2015. DOI: 10.3115/v1/p15-1113.

K. Weinberger, A. Dasgupta, J. Attenberg, J. Langford, and A. J. Smola. Feature hashing for large scale multitask learning. In International Conference on Machine Learning, 2009. DOI:10.1145/1553374.1553516.

David Weiss, Chris Alberti, Michael Collins, and Slav Petrov. Structured training for neural network transition-based parsing. In Proc. of the 53rd Annual Meeting of the Association for Computational Linguistics and the 7th International Joint Conference on Natural Language Processing—(Volume 1: Long Papers), pages 323–333, Beijing, China, July 2015. DOI: 10.3115/v1/p15-1032.

P. J. Werbos. Backpropagation through time: What it does and how to do it. Proc. of the IEEE, 78(10):1550–1560, 1990. ISSN 0018-9219. DOI: 10.1109/5.58337.

Jason Weston, Antoine Bordes, Oksana Yakhnenko, and Nicolas Usunier. Connecting language and knowledge bases with embedding models for relation extraction. In Proc. of the Conference on Empirical Methods in Natural Language Processing, pages 1366–1371, Seattle, Washington. Association for Computational Linguistics, October 2013.

Philip Williams, Rico Sennrich, Matt Post, and Philipp Koehn. Syntax-based Statistical Machine Translation. Synthesis Lectures on Human Language Technologies. Morgan & Claypool Publishers, 2016. DOI: 10.2200/s00716ed1v04y201604hlt033.

Sam Wiseman and Alexander M. Rush. Sequence-to-sequence learning as beam-search optimization. In Proc. of the Conference on Empirical Methods in Natural Language Processing (EMNLP). Association for Computational Linguistics, 2016. DOI: 10.18653/v1/d16-1137.

Sam Wiseman, M. Alexander Rush, and M. Stuart Shieber. Learning global features for coreference resolution. In Proc. of the Conference of the North American Chapter of the Association for Computational Linguistics: Human Language Technologies, pages 994–1004, 2016. http://aclweb.org/anthology/N16-1114 DOI: 10.18653/v1/N16-1114.

Yijun Xiao and Kyunghyun Cho. Efficient character-level document classification by combining convolution and recurrent layers. CoRR, abs/1602.00367, 2016. http://arxiv.org, abs/1602.00367

Wenduan Xu, Michael Auli, and Stephen Clark. CCG supertagging with a recurrent neural network. In Proc. of the 53rd Annual Meeting of the Association for Computational Linguistics and the 7th International Joint Conference on Natural Language Processing—(Volume 2: Short Papers), pages 250–255, Beijing, China, July 2015. DOI: 10.3115/v1/p15-2041.

Wenpeng Yin and Hinrich Schütze. Convolutional neural network for paraphrase identification. In Proc. of the Conference of the North American Chapter of the Association for Computational Linguistics: Human Language Technologies, pages 901–911, Denver, Colorado, 2015. DOI: 10.3115/v1/n15-1091.

Fisher Yu and Vladlen Koltun. Multi-scale context aggregation by dilated convolutions. In ICLR, 2016.

Wojciech Zaremba, Ilya Sutskever, and Oriol Vinyals. Recurrent neural network regularization. arXiv:1409.2329 [cs], September 2014.

Matthew D. Zeiler. ADADELTA: An adaptive learning rate method. arXiv:1212.5701 [cs], December 2012.

Daojian Zeng, Kang Liu, Siwei Lai, Guangyou Zhou, and Jun Zhao. Relation classification via convolutional deep neural network. In Proc. of COLING, the 25th International Conference on Computational Linguistics: Technical Papers, pages 2335–2344, Dublin, Ireland, Dublin City University and Association for Computational Linguistics, August 2014.

Hao Zhang and Ryan McDonald. Generalized higher-order dependency parsing with cube pruning. In Proc. of the Joint Conference on Empirical Methods in Natural Language Processing and Computational Natural Language Learning, pages 320–331. Association for Computational Linguistics, 2012. http://aclweb.org/anthology/D12-1030

Tong Zhang. Statistical behavior and consistency of classification methods based on convex risk minimization. The Annals of Statistics, 32:56–85, 2004. DOI: 10.1214/aos/1079120130.

Xiang Zhang, Junbo Zhao, and Yann LeCun. Character-level convolutional networks for text classification. In C. Cortes, N. D. Lawrence, D. D. Lee, M. Sugiyama, and R. Garnett, Eds., Advances in Neural Information Processing Systems 28, pages 649–657. Curran Associates, Inc., 2015. http://papers.nips.cc/paper-5782-character-level-convolutional-networks-for-text-classification.pdf

Xingxing Zhang, Jianpeng Cheng, and Mirella Lapata. Dependency parsing as head selection. CoRR, abs/1606.01280, 2016. http://arxiv.org/abs/1606.01280

Yuan Zhang and David Weiss. Stack-propagation: Improved representation learning for syntax. In Proc. of the 54th Annual Meeting of the Association for Computational Linguistics—(Volume 1: Long Papers), pages 1557–1566, 2016. http://aclweb.org/anthology/P16-1117 DOI: 10.18653/v1/P16-1147.

Hao Zhou, Yue Zhang, Shujian Huang, and Jiajun Chen. A neural probabilistic structured-prediction model for transition-based dependency parsing. In Proc. of the 53rd Annual Meeting of the Association for Computational Linguistics and the 7th International Joint Conference on Natural Language Processing—(Volume 1: Long Papers), pages 1213–1222, Beijing, China, July 2015. DOI: 10.3115/v1/p15-1117.

Chenxi Zhu, Xipeng Qiu, Xinchi Chen, and Xuanjing Huang. A re-ranking model for dependency parser with recursive convolutional neural network. In Proc. of the 53rd Annual Meeting of the Association for Computational Linguistics and the 7th International Joint Conference on Natural Language Processing—(Volume 1: Long Papers), pages 1159–1168, Beijing, China, July 2015a. DOI: 10.3115/v1/p15-1112.

Xiaodan Zhu, Parinaz Sobhani, and Hongyu Guo. Long short-term memory over tree structures. March 2015b.

Hui Zou and Trevor Hastie. Regularization and variable selection via the elastic net. Journal of the Royal Statistical Society, Series B, 67:301–320, 2005. DOI: 10.1111/j.1467-9868.2005.00503.x.

# Author's Biography

## YOAV GOLDBERG

Yoav Goldberg has been working in natural language processing for over a decade. He is a Senior Lecturer at the Computer Science Department at Bar-Ilan University, Israel. Prior to that, he was a researcher at Google Research, New York. He received his Ph.D. in Computer Science and Natural Language Processing from Ben Gurion University (2011). He regularly reviews for NLP and machine learning venues, and serves at the editorial board of Computational Linguistics. He published over 50 research papers and received best paper and outstanding paper awards at major natural language processing conferences. His research interests include machine learning for natural language, structured prediction, syntactic parsing, processing of morphologically rich languages, and, in the past two years, neural network models with a focus on recurrent neural networks.

![原书图像；请以 source.pdf 为准](../../../transcripts/mineru/neural-network-methods-nlp/parts/part-002-pages-201-316/images/5bd354aa7982e9a62aca86a782a033c7362cefda577a03beb085bf788a1ff5a2.jpg)

![原书图像；请以 source.pdf 为准](../../../transcripts/mineru/neural-network-methods-nlp/parts/part-002-pages-201-316/images/dcb9b6fefe32ebd6fa1eeb9d8eb066227f2e533979bb6228f3bd39903ffa480c.jpg)

SYNTHESIS LECTURES ON

HUMAN LANGUAGE TECHNOLOGIES

# Series Editor: Graeme Hirst, University of Toronto

## Neural Network Methods for Natural Language Processing

## Yoav Goldberg, Bar Ilan University

Neural networks are a family of powerful machine learning models. This book focuses on the application of neural network models to natural language data. The first half of the book (Parts I and II) covers the basics of supervised machine learning and feed-forward neural networks, the basics of working with machine learning over language data, and the use of vector-based rather than symbolic representations for words. It also covers the computation-graph abstraction, which allows to easily define and train arbitrary neural networks, and is the basis behind the design of contemporary neural network software libraries.

The second part of the book (Parts III and IV) introduces more specialized neural network architectures, including 1D convolutional neural networks, recurrent neural networks, conditioned-generation models, and attention-based models. These architectures and techniques are the driving force behind state-of-the-art algorithms for machine translation, syntactic parsing, and many other applications. Finally, we also discuss tree-shaped networks, structured prediction, and the prospects of multi-task learning.

## ABOUT SYNTHESIS

This volume is a printed version of a work that appears in the Synthesis Digital Library of Engineering and Computer Science. Synthesis lectures provide concise original presentations of important research and development topics, published quickly in digital and print formats. For more information, visit our website: http://store.morganclaypool.com

