#ifndef OLD_Q_NET_H
#define OLD_Q_NET_H

#include "inet.h"
using namespace gnn;

class OldQNet : public INet
{
public:
    OldQNet();

    virtual void BuildNet() override;
    virtual void SetupTrain(std::vector<int>& idxes, 
                            std::vector< std::shared_ptr<Graph> >& g_list, 
                            std::vector< std::shared_ptr<IState> >& states, 
                            std::vector<int>& actions, 
                            std::vector<double>& target) override;
                            
    virtual void SetupPredAll(std::vector<int>& idxes, 
                              std::vector< std::shared_ptr<Graph> >& g_list, 
                              std::vector< std::shared_ptr<IState> >& states) override;

    void SetupGraphInput(std::vector<int>& idxes, 
                         std::vector< std::shared_ptr<Graph> >& g_list, 
                         std::vector< std::shared_ptr<IState> >& states, 
                         const int* actions);

    SpTensor<CPU, Dtype> act_select, rep_global;
    SpTensor<mode, Dtype> m_act_select, m_rep_global;

    std::vector< std::set<int> > list_set;
};

#endif